package apiTests.examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.junit.Assert.assertTrue;

public class UsersRunner {

    @BeforeClass
    public static void before(){
        System.setProperty("karate.env", "qa");
        System.setProperty("karate.user", "Sales User");
    }

    @Test
    public void testParallel() {
        String user = System.getProperty("karate.user");
        System.out.println("Selected user: "+user);

        if(user.equalsIgnoreCase("Sales User")){
            Results results = Runner.path("classpath:apiTests/examples").tags("~@ignore", "@sampleAPIs").parallel(5);
            assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        }
        else if (user.equalsIgnoreCase("Admin")){
        }
        else {}
    }

}
