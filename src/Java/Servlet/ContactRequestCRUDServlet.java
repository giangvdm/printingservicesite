/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.RequestDAO;
import Model.Request;
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
public class ContactRequestCRUDServlet extends HttpServlet {

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
        try {
            String action = request.getParameter("action");
            if (action.equals("view")) {
                Request tmpContactRequest = RequestDAO.getContactRequestById(Integer.parseInt(request.getParameter("id")));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view-contact-request.jsp");
                request.setAttribute("contactRequest", tmpContactRequest);
                dispatcher.forward(request, response);
            }
            else if (action.equals("change-status")) {
                Request tmpContactRequest = RequestDAO.getContactRequestById(Integer.parseInt(request.getParameter("id")));
                String newStatus = request.getParameter("to");
                RequestDAO.changeStatus(tmpContactRequest, newStatus);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-contact-request.jsp");
                request.setAttribute("action", "change-status");
                request.setAttribute("status", "success");
                dispatcher.forward(request, response);
            }
            else if (action.equals("delete")) {
                Request tmpContactRequest = RequestDAO.getContactRequestById(Integer.parseInt(request.getParameter("id")));
                RequestDAO.deleteContactRequest(tmpContactRequest);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-contact-request.jsp");
                request.setAttribute("action", "delete-request");
                request.setAttribute("status", "success");
                dispatcher.forward(request, response);
            }
        }
        catch (IOException ex) {}
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
