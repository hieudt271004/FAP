/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.DepartmentDBContext;
import dal.LecturerDBContext;
import dal.RoleDBContext;
import dal.StudentDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Role;
import model.User;

/**
 *
 * @author sonnt-local
 */
public class LoginController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDBContext db = new UserDBContext();
        RoleDBContext roledb = new RoleDBContext();
        User user = db.getUserByUsernamePassword(username, password);
        
        if (user != null) {
            Role role = roledb.getRoleByUser(user);
            if (role.getId() == 1) {
                user.setStudent(new StudentDBContext().getStudentByUserName(user));
                request.getSession().setAttribute("user", user);
                response.sendRedirect("view/student/home.jsp");
            } else if (role.getId() == 2) {
                
                user.setLecturer(new LecturerDBContext().getLecturerByUserName(user));
                request.getSession().setAttribute("user", user);
                response.sendRedirect("view/lecturer/home.jsp");
            } else if (role.getId() == 3) {
                
                user.setDepartment(new DepartmentDBContext().getDepartmentByUserName(user));
                request.getSession().setAttribute("user", user);
                response.sendRedirect("view/department/home.jsp");
            }

        } else {
            response.getWriter().println("login failed!");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
