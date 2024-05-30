package performanceTests.Examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
import org.testng.annotations.BeforeClass;

import static org.junit.Assert.assertTrue;

// important: do not use @RunWith(Karate.class) !
public class PerfTestRunner {
    @BeforeClass
public static void before(){
    System.setProperty("karate.env", "qa");
    System.setProperty("karate.user", "Sales User");
}
    @Test
    public void testParallel() {
        String user = System.getProperty("karate.user");
        System.out.println("Selected user Orders: "+user);

        if(user.equalsIgnoreCase("Sales User")){
            Results results = Runner.path("classpath:performanceTests/Examples").tags("~@ignore", "@performanceTest").parallel(5);
            assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        }
        else if (user.equalsIgnoreCase("Admin")){
            Results results = Runner.path("classpath:TestCases").tags("~@ignore","Admin").parallel(5);
            assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        }
        else {
        }
    }
}