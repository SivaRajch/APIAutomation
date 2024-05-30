package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertEquals;

// important: do not use @RunWith(Karate.class) !
public class TestRunner {
    public String browserCount = System.getProperty("browserscount");
    public String testsuite = System.getProperty("testsuite");
    public static String releaseVersion = System.getProperty("releaseversion");
    public static String team = System.getProperty("team");
    public static String env = System.getProperty("env");
    public static String buildDirectory = System.getProperty("targetdir");
    public static String reportsPath;
    int browsers = 1;
    String suite = "uiTests";
    String environment = "";
    String targetDir = "target";

    @Test
    public void testParallel() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss.SSS");
        LocalDateTime now = LocalDateTime.now();
        String timestamp = dtf.format(now);
        if(buildDirectory!=null){
            targetDir = buildDirectory;
        }
        if(env!=null){
            environment = env.toLowerCase();
        }
        if(browserCount!=null){
            browsers = Integer.parseInt(browserCount);
        }
        if(testsuite.equalsIgnoreCase("api")){
            suite = "apiTests";
        } else if (testsuite.equalsIgnoreCase("ui")) {
            suite = "uiTests";
        }
        reportsPath = targetDir + "/report/" + buildDirectory;
        System.setProperty("reportsPath",reportsPath);
        System.setProperty("targetdir",targetDir);
        Results results = Runner.path("classpath:"+suite)
                .reportDir(reportsPath+"/karate-html-reports")
//                .tags("")
                .outputCucumberJson(true)
                .karateEnv(environment)
                .parallel(browsers);
        generateReport(results.getReportDir(),reportsPath);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }

    public static void generateReport(String karateOutputPath, String reportsPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File(reportsPath), "Test Automation");
        config.addClassifications("Framework","KARATE");
        config.addClassifications("Environment",env.toUpperCase());
        config.addClassifications("Module",team.toUpperCase());
        config.addClassifications("Release Version",releaseVersion);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}