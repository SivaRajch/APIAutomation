package CommonUtility.Java;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Iterator;

public class DatabaseConnection {
    static java.sql.Connection dbconn = null;
    String dburl = null;
    String dbUsername = null;
    String dbPassword = null;
    String dbSchema = null;
    String secretName = null;

    public java.sql.Connection getDBConnection(String dbSchema, String platformURL) {
        if (isEC2Server()) {
            System.out.println("Script is running on an AWS server.");
            if (platformURL.contains("dev.frequence.rocks")) {
                secretName = GetDataFromPropertiesFiles.getProperty("config", "DEV_DB_SECRET_NAME");
                getDBConnectionFromSecretsManager(secretName);
            } else if (platformURL.contains("qa.frequence.rocks")) {
                secretName = GetDataFromPropertiesFiles.getProperty("config", "QA_DB_SECRET_NAME");
                getDBConnectionFromSecretsManager(secretName);
            } else if (platformURL.contains("stage.frequence.rocks") || platformURL.contains("brandcdnstage.com")) {
//                secretName = GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_SECRET_NAME");
//                getDBConnectionFromSecretsManager(secretName);
                dburl = "jdbc:" + GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_URL") + dbSchema + "?useSSL=false";
                dbUsername = GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_USERNAME");
                dbPassword = GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_PASSWORD");
            } else if (platformURL.contains("brandcdn.com")) {
                secretName = GetDataFromPropertiesFiles.getProperty("config", "PROD_DB_SECRET_NAME");
                getDBConnectionFromSecretsManager(secretName);
            }
        } else {
            System.out.println("Script is running on an Local System.");
            if (platformURL.contains("dev.frequence.rocks")) {
                dburl = "jdbc:" + GetDataFromPropertiesFiles.getProperty("config", "DEV_DB_URL") + dbSchema + "?useSSL=false";
                dbUsername = GetDataFromPropertiesFiles.getProperty("config", "DEV_DB_USERNAME");
                dbPassword = GetDataFromPropertiesFiles.getProperty("config", "DEV_DB_PASSWORD");
            } else if (platformURL.contains("qa.frequence.rocks")) {
                dburl = "jdbc:" + GetDataFromPropertiesFiles.getProperty("config", "QA_DB_URL") + dbSchema + "?useSSL=false";
                dbUsername = GetDataFromPropertiesFiles.getProperty("config", "QA_DB_USERNAME");
                dbPassword = GetDataFromPropertiesFiles.getProperty("config", "QA_DB_PASSWORD");
            } else if (platformURL.contains("stage.frequence.rocks") || platformURL.contains("brandcdnstage.com")) {
                dburl = "jdbc:" + GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_URL") + dbSchema + "?useSSL=false";
                dbUsername = GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_USERNAME");
                dbPassword = GetDataFromPropertiesFiles.getProperty("config", "STAGE_DB_PASSWORD");

            } else if (platformURL.contains("brandcdn.com")) {
                dburl = "jdbc:" + GetDataFromPropertiesFiles.getProperty("config", "PROD_DB_URL") + dbSchema + "?useSSL=false";
                dbUsername = GetDataFromPropertiesFiles.getProperty("config", "PROD_DB_USERNAME");
                dbPassword = GetDataFromPropertiesFiles.getProperty("config", "PROD_DB_PASSWORD");
            }
        }
        try {
            dbconn = DriverManager.getConnection(dburl, dbUsername, dbPassword);
            if (dbconn != null) {
                System.out.println("Connected to DB");
            } else {
                System.out.println("some problem with connection");
            }

        } catch (SQLException sqlEx) {
            System.out.println("SQL Exception:" + sqlEx.getStackTrace());
        }
        return dbconn;
    }

    public void close(java.sql.Connection db) throws IOException {
        try {
            dbconn.close();
            System.out.println("connection closed");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getDBConnectionFromSecretsManager(String secretName) {

        JSONParser parser = new JSONParser();
        JSONObject json = SecretsManager.getSecret(secretName);
        Iterator<String> keys = json.keySet().iterator();
        String firstKey = keys.next();
        JSONObject dbDetails = null;
        try {
            dbDetails = (JSONObject) parser.parse((String) json.get(firstKey));
            dbSchema = (String) dbDetails.get("dbname");
            dburl = "jdbc:mysql://" + dbDetails.get("host") + "/" + dbSchema + "?useSSL=false";
            dbUsername = (String) dbDetails.get("username");
            dbPassword = (String) dbDetails.get("password");
        } catch (ParseException e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean isEC2Server() {
        InetAddress addr = null;
        boolean flag = false;
        try {
            addr = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            System.out.println(e.getMessage());
        }
        if (addr.getHostAddress().startsWith("10.") || addr.getHostAddress().startsWith("172.16.") || addr.getHostAddress().startsWith("192.168.")) {
            flag = true;
        }
        return flag;
    }
}