/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Academic;
import model.Application;
import model.Profile;
import model.Student;

/**
 *
 * @author ai
 */
public class ProfileDBContext extends DBContext<Profile>{
    
    public Profile showProfile(Student student) {
        Profile pro = new Profile();
        String sname = student.getName();
        try {
            String sql = "Select profile_id, fullname, dob, gender, id_card, student_address, phonenumber, email, date_of_issue, place_of_isue from profile"
                    + " join students on profile.sid = students.sid where students.sname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sname);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                pro.setProfileID(rs.getInt("profile_id"));
                pro.setFullName(rs.getString("fullname"));
                pro.setGenger(rs.getBoolean("gender"));
                pro.setDob(rs.getDate("dob"));
                pro.setIdCard(rs.getString("id_card"));
                pro.setAddress(rs.getString("student_address"));
                pro.setPhoneNumber(rs.getString("phonenumber"));
                pro.setEmail(rs.getString("email"));
                pro.setIssueDate(rs.getDate("date_of_issue"));
                pro.setIssuePlace(rs.getString("place_of_isue"));
            }
        }catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }
    
    public Academic showAcademic(Student student) {
        Academic pro = new Academic();
        String sname = student.getName();
        try {
            String sql = "Select academic_id, roll_number, old_number, enroll_date, mode, student_status, current_term, major, curriculumn, capstone from academic"
                    + " join students on academic.sid = students.sid where students.sname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sname);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                pro.setAcademicID(rs.getInt("academic_id"));
                pro.setRollNumber(rs.getString("roll_number"));
                pro.setOldNumber(rs.getString("old_number"));
                pro.setEnrollDate(rs.getDate("enroll_date"));
                pro.setMode(rs.getString("mode"));
                pro.setStudentStatus(rs.getBoolean("student_status"));
                pro.setCurrentTerm(rs.getString("current_term"));
                pro.setMajor(rs.getString("major"));
                pro.setCurriculumn(rs.getString("curriculumn"));
                pro.setCapstone(rs.getString("capstone"));
            }
        }catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }
    
    public void updateProfile(Profile model, Student student) {
        PreparedStatement stm_insert = null;
        int studentId = student.getId();
        try {
            String sql_insert_emp = "UPDATE [profile]\n"
                    + "   SET [fullname] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[id_card] = ?\n"
                    + "      ,[student_address] = ?\n"
                    + "      ,[phonenumber] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[date_of_issue] = ?\n"
                    + "      ,[place_of_isue] = ?\n"
                    + " WHERE [sid] = ?";

            stm_insert = connection.prepareStatement(sql_insert_emp);
            stm_insert.setString(1, model.getFullName());
            stm_insert.setDate(2, (java.sql.Date) model.getDob());
            stm_insert.setString(3, model.getIdCard());
            stm_insert.setString(4, model.getAddress());
            stm_insert.setString(5, model.getPhoneNumber());
            stm_insert.setString(6, model.getEmail());
            stm_insert.setDate(7, (java.sql.Date)model.getIssueDate());
            stm_insert.setString(8, model.getIssuePlace());
            stm_insert.setInt(9, studentId);
            stm_insert.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void insert(Profile model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Profile model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Profile model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Profile get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Profile> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
