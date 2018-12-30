/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.OrderDAO;
import Model.Order;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vumin
 */
public class EditOrder extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //
        int id = Integer.parseInt(request.getParameter("id"));
        int total = Integer.parseInt(request.getParameter("total"));
        String description = "number-of-pages:" + request.getParameter("number-of-pages") + 
        ";number-of-copies:" + request.getParameter("number-of-copies") +
        ";number-of-side:" + request.getParameter("number-of-side") +
        ";paper-size:" + request.getParameter("paper-size") +
        ";paper-quality:" + request.getParameter("paper-quality") +
        ";bookbinding:" + request.getParameter("bookbinding") +
        ";bookbinding-method:" + request.getParameter("bookbinding-method") +
        ";cover-quality:" + request.getParameter("cover-quality") +
        ";extra-requirement:" + request.getParameter("extra-requirement");
        //
        String customerName = request.getParameter("customer-name");
        String customerEmail = request.getParameter("customer-email");
        String customerPhone = request.getParameter("customer-tel");
        String customerAddress = request.getParameter("customer-address");
        
        Order tmpOrder = new Order(id, description, total, customerName, customerEmail, customerPhone, customerAddress);
        OrderDAO.updateOrderInfo(tmpOrder);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("manage-order.jsp");
        request.setAttribute("action", "edit-order");
        request.setAttribute("status", "success");
        dispatcher.forward(request, response);
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
