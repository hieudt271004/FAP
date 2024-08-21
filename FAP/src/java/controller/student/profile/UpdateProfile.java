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
import java.sql.Date;
import model.Academic;
import model.Profile;
import model.Student;
import model.User;

/**
 *
 * @author ai
 */
public class UpdateProfile extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        ProfileDBContext db = new ProfileDBContext();
        Profile p = db.showProfile(student);
        Academic a = db.showAcademic(student);
        request.setAttribute("student", student);
        request.setAttribute("profile", p);
        request.setAttribute("academic", a);   
        request.getRequestDispatcher("view/student/updateProfile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String idCard = request.getParameter("idcard");
        String studentAddress = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Date dateIssue = Date.valueOf(request.getParameter("dateissue"));
        String placeIssue = request.getParameter("placeissue");

        Profile p = new Profile(fullname, idCard, studentAddress, phone, email, placeIssue, dob, dateIssue);
        ProfileDBContext db = new ProfileDBContext();
        db.updateProfile(p, student);

        response.sendRedirect("viewprofile");
    }

}
