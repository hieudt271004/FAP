/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student.app;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.ApplicationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Application;
import model.Student;
import model.User;

/**
 *
 * @author ai
 */
public class ViewApp extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        ApplicationDBContext db = new ApplicationDBContext();
        ArrayList<Application> app = new ArrayList<>();
        app = db.viewFeedback(student);
        request.setAttribute("app", app);
        request.getRequestDispatcher("view/student/viewFeedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        ApplicationDBContext db = new ApplicationDBContext();
        ArrayList<Application> app = new ArrayList<>();
        app = db.viewFeedback(student);
        request.setAttribute("app", app);
        request.getRequestDispatcher("view/student/viewFeedback").forward(request, response);
    }

}
