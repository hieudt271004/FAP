/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student.app;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.ApplicationDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.Date;
import model.Application;
import model.Student;
import model.User;

/**
 *
 * @author ai
 */
public class SendApp extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        String send = request.getParameter("send");
        LocalDateTime sendAt = LocalDateTime.now();

        int studentId = student.getId();
        ApplicationDBContext dao = new ApplicationDBContext();
        Application app = new Application(studentId, send, sendAt);

        request.setAttribute("send", send);
        request.setAttribute("sendAt", sendAt);

        request.getRequestDispatcher("view/student/sendApplication.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        String send = request.getParameter("send");
        LocalDateTime sendAt = LocalDateTime.now();

        int studentId = student.getId();
        ApplicationDBContext dao = new ApplicationDBContext();
        Application app = new Application(studentId, send, sendAt);
        dao.studentSendApplication(app);

        request.setAttribute("send", send);
        request.setAttribute("sendAt", sendAt);

        request.getRequestDispatcher("view/student/sendApplication.jsp").forward(request, response);

    }

}
