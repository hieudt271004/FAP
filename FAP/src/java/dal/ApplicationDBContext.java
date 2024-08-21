/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Application;
import java.sql.*;
import java.time.LocalDateTime;
import model.Department;
import model.Student;

/**
 *
 * @author ai
 */
public class ApplicationDBContext extends DBContext<Application> {

    public ArrayList<Application> viewFeedbackAll(Department d) {
        ArrayList<Application> apps = new ArrayList<>();
        try {
            String sql = "Select sendApp, send_at, feedback, feedback_time from application "
                    + "where did = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, d.getDid());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Application app = new Application();
                app.setSend(rs.getString("sendApp"));
                app.setSendAt(rs.getTimestamp("send_at").toLocalDateTime());
                app.setFeedback(rs.getString("feedback"));
                try {
                    app.setFeedbackTime(rs.getTimestamp("feedback_time").toLocalDateTime());
                } catch (Exception e) {
                }

                apps.add(app);

            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apps;
    }

    public ArrayList<Application> viewFeedback(Student s) {
        ArrayList<Application> apps = new ArrayList<>();
        try {
            String sql = "Select sendApp, send_at, feedback, feedback_time from application "
                    + "where sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Application app = new Application();
                app.setSend(rs.getString("sendApp"));
                app.setSendAt(rs.getTimestamp("send_at").toLocalDateTime());
                app.setFeedback(rs.getString("feedback"));
                try {
                    app.setFeedbackTime(rs.getTimestamp("feedback_time").toLocalDateTime());
                } catch (Exception e) {

                }
                apps.add(app);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apps;
    }

    public ArrayList<Application> showApplication() {
        ArrayList<Application> apps = new ArrayList<>();

        try {
            String sql = "Select app_id, sid, sendApp, send_at, feedback from application";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Application app = new Application();
                app.setId(rs.getInt("app_id"));
                app.setSid(rs.getInt("sid"));
                app.setSend(rs.getString("sendApp"));
                app.setSendAt(rs.getTimestamp("send_at").toLocalDateTime());
                try {
                    app.setFeedback(rs.getString("feedback"));
                } catch (Exception e) {

                }
                apps.add(app);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apps;
    }

    public void studentSendApplication(Application app) {
        try {
            String sql = "INSERT INTO application (sid, sendApp, send_at, did) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, app.getSid());
            stmt.setString(2, app.getSend());
            stmt.setTimestamp(3, Timestamp.valueOf(app.getSendAt()));
            stmt.setInt(4, 1);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void departmentFeedback(Application app) {
        
        try {
            String sql = "UPDATE [dbo].[application]\n"
                    + "   SET feedback = ?, feedback_time = ? \n"
                    + " WHERE app_id = ? ";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, app.getFeedback());
            stmt.setTimestamp(2, Timestamp.valueOf(app.getFeedbackTime()));
            stmt.setInt(3, app.getId());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    @Override
    public void insert(Application model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Application model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Application model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Application get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Application> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        ApplicationDBContext dao = new ApplicationDBContext();
        Application app = new Application();
        app.setId(1017);
        app.setFeedback("fdf");
        app.setFeedbackTime(LocalDateTime.now());
        dao.departmentFeedback(app);
    }

}
