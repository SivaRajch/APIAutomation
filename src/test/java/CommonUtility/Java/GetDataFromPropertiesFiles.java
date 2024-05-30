package CommonUtility.Java;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class GetDataFromPropertiesFiles {
    public final static String path = System.getProperty("user.dir");
    private static final Properties CONFIG_PROPERTIES = new Properties();

    /**
     * Returns the value of the property corresponding to key.
     *
     * @param key the name of the property
     * @return the value of the property
     */
    public static String getProperty(String fileName, String key) {
        FileInputStream fileInput = null;
        File file = new File(path + "/src/test/java/Properties/" + fileName + ".properties");
        try {
            fileInput = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            CONFIG_PROPERTIES.load(fileInput);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return CONFIG_PROPERTIES.getProperty(key);
    }
}