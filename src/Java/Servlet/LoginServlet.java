/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.AdminDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.Order;
import Model.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim(); 
        String userType = request.getParameter("user-type").trim();
        
        if (userType.equals("customer")) { // customer login
            if(UserDAO.validate(username, password)){
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", UserDAO.getUserByName(username));
                session.setAttribute("loggedIn", true);
                ArrayList<Order> orderList = OrderDAO.SelectOrderByName(UserDAO.getUserByName(username).getFullname());
                session.setAttribute("orderList", orderList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
            }
            else {
                request.setAttribute("action", "login");
                request.setAttribute("status", "error");
                request.getRequestDispatcher("/login.jsp").forward(request, response);               
            }
        }
        else { // admin login
            if(AdminDAO.verify(username, password)){
                HttpSession session = request.getSession();
                session.setAttribute("currentAdmin", AdminDAO.getAdminByUsername(username));
                session.setAttribute("loggedIn", true);
                
                ArrayList<User> userList = UserDAO.getAllUser();
//                HttpSession session = request.getSession();
                session.setAttribute("userList", userList);
//                response.sendRedirect(request.getContextPath() + "/admin.jsp");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
            }
            else {
                request.setAttribute("status", "error");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
        }
    }
    
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
        processRequest(request, response);
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
        processRequest(request, response);
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
