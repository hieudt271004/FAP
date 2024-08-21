/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student.profile;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.ProfileDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Academic;
import model.Profile;
import model.Student;
import model.User;

/**
 *
 * @author ai
 */
public class ViewProfile extends BaseRequiredStudentAuthenticationController{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
      //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
      ProfileDBContext db = new ProfileDBContext();
        Profile p = db.showProfile(student);
        Academic a = db.showAcademic(student);
        
        
        request.setAttribute("student", student);
        request.setAttribute("profile", p);
        request.setAttribute("academic", a);   
      request.getRequestDispatcher("view/student/viewProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
      //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        ProfileDBContext db = new ProfileDBContext();
        Profile p = db.showProfile(student);
        Academic a = db.showAcademic(student);
        
        request.setAttribute("profile", p);
        request.setAttribute("academic", a);
        
        request.getRequestDispatcher("view/student/viewProfile.jsp").forward(request, response);
    }
    
}
