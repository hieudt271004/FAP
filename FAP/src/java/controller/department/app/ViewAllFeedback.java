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
import java.util.ArrayList;
import model.Application;
import model.Department;
import model.User;

/**
 *
 * @author ai
 */
public class ViewAllFeedback extends BaseRequiredDepartmentAuthenticationController{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Department department) throws ServletException, IOException {
       // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
       ApplicationDBContext db = new ApplicationDBContext();
          ArrayList<Application> app = new ArrayList<>();
          app = db.viewFeedbackAll(department);
          request.setAttribute("app", app);
          request.setAttribute("department", department);
       request.getRequestDispatcher("view/department/viewFeedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Department department) throws ServletException, IOException {
      //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        ApplicationDBContext db = new ApplicationDBContext();
          ArrayList<Application> app = new ArrayList<>();
          app = db.viewFeedbackAll(department);
          request.setAttribute("app", app);
          request.setAttribute("department", department);
          
          request.getRequestDispatcher("view/department/viewFeedback.jsp").forward(request, response);
    
    }
    
    
}
