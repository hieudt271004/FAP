/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.department.app;

import controller.auth.BaseRequiredDepartmentAuthenticationController;
import dal.ApplicationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import model.Application;
import model.Department;
import model.User;

/**
 *
 * @author ai
 */
public class Feedback extends BaseRequiredDepartmentAuthenticationController{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Department department) throws ServletException, IOException {
      //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
         
        ApplicationDBContext dao = new ApplicationDBContext();
        List<Application> app = dao.showApplication();

        request.setAttribute("app", app);

        request.getRequestDispatcher("view/department/showApp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Department department) throws ServletException, IOException {
       // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        
        int appId = Integer.parseInt(request.getParameter("app_id"));
        String feedback = request.getParameter("feedback" + appId);
        LocalDateTime feedbacktime = LocalDateTime.now();

        int did = department.getDid();
        ApplicationDBContext dao = new ApplicationDBContext();
        Application app = new Application();
        app.setId(appId);
        app.setFeedback(feedback);
        app.setFeedbackTime(feedbacktime);
        app.setDid(did);
        dao.departmentFeedback(app);

        response.sendRedirect("feedback");
    }
    
}
