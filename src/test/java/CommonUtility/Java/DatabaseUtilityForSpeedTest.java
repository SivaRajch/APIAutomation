package CommonUtility.Java;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DatabaseUtilityForSpeedTest {
    public static JSONArray getEventData(String dbSchema, String platformURL) throws Throwable {
        java.sql.Connection db;
        ArrayList<String> dbQuickStatsDetails = new ArrayList<String>();
        DatabaseConnection connDB = new DatabaseConnection();
        db = connDB.getDBConnection(dbSchema, platformURL);
        String sql = "SELECT aem.id,aem.event_id,aem.event_name,aet.event_type_name,aet.recommended_limit_milliseconds\n" +
                "FROM automation_events_master aem, automation_event_type aet\n" +
                "WHERE aem.automation_event_type_id = aet.id";
        JSONArray jsonArray = new JSONArray();
        try (PreparedStatement pstmt = db.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int columns = rs.getMetaData().getColumnCount();
                JSONObject obj = new JSONObject();
                for (int i = 0; i < columns; i++)
                    obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1).toString().trim());
                jsonArray.add(obj);
            }
            return jsonArray;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            connDB.close(db);
        }
        return null;
    }

    public static void updateSpeedTestData(String dbSchema, String platformURL, int automationEventMasterID, int observedTimeMilliseconds,String automationRunName) throws Throwable {
        java.sql.Connection db;
        DatabaseConnection connDB = new DatabaseConnection();
        db = connDB.getDBConnection(dbSchema, platformURL);
        String sql = "INSERT INTO" +
                " automation_events_log (automation_event_master_id,observed_time_milliseconds,automation_run_name,updated_timestamp)" +
                " VALUES (?,?,?,?)";
        try {
            PreparedStatement preparedStmt = db.prepareStatement(sql);
            preparedStmt.setInt(1, automationEventMasterID);
            preparedStmt.setInt(2, observedTimeMilliseconds);
            preparedStmt.setString(3, automationRunName);
            preparedStmt.setString(4, "0000-00-00 00:00:00");
            preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            connDB.close(db);
        }
    }

    public static void updateSpeedTestResultData(String dbSchema, String platformURL, String[][] report) throws Throwable {
        java.sql.Connection db;
        DatabaseConnection connDB = new DatabaseConnection();
        db = connDB.getDBConnection(dbSchema, platformURL);
        db.setAutoCommit(false);
        int batchSize = 20;
        int count =0;
        String sql = "INSERT INTO" +
                " automation_events_log (automation_event_master_id,observed_time_milliseconds,automation_run_name,updated_timestamp)" +
                " VALUES (?,?,?,?)";
        try {
            PreparedStatement preparedStmt = db.prepareStatement(sql);

            for (String[] row:report){
                    preparedStmt.setInt(1, Integer.parseInt(row[0]));
                    preparedStmt.setInt(2, Integer.parseInt(row[1]));
                    preparedStmt.setString(3, row[2]);
                    preparedStmt.setString(4, "0000-00-00 00:00:00");
                    preparedStmt.addBatch();
                    if (count % batchSize == 0) {
                        preparedStmt.executeBatch();
                    }
            }
            preparedStmt.executeBatch();
            db.commit();
            System.out.println("Inserted Records : "+report.length);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            connDB.close(db);
        }
    }

}
