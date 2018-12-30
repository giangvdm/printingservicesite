/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Khanh
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
    
    private void writeToDB(Connection conn, String fileName, InputStream is, String description, int id, String username, String userPhone, String userMail, String userAddress, int price) throws SQLException{
 
        String sql = "INSERT INTO [dbo].[Order](filename,filedata,description,date,cus_id,cus_name,cus_email,cus_tel,cus_address,status,total) " + " VALUES (?,?,?,?,?,?,?,?,?,?,?) ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMDD HH:MM:SS");
        String time = sdf.format(cal.getTime());
        Timestamp timestamp = new Timestamp(cal.getTimeInMillis());

        
        pstm.setString(1, fileName);
        pstm.setBlob(2, is);
        pstm.setString(3, description);
        pstm.setTimestamp(4, timestamp);
        pstm.setInt(5, id);
        pstm.setString(6, username);
        pstm.setString(7, userMail);
        pstm.setString(8, userPhone);
        pstm.setString(9, userAddress);
        pstm.setString(10, "pending");
        pstm.setInt(11, price);
        pstm.executeUpdate();
    }

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            Connection conn = null;
            conn = ConnectionManager.getConnection();     
            conn.setAutoCommit(false);
            
            int cus_id = Integer.parseInt(request.getParameter("cus_id").trim());
            String name = request.getParameter("customer-name");
            String phone = request.getParameter("customer-tel");
            String mail = request.getParameter("customer-email");
            String address = request.getParameter("customer-address");
            
            int price = Integer.parseInt(request.getParameter("total").trim());
            
            String description = "number-of-pages:" + request.getParameter("number-of-pages") + 
                    ";number-of-copies:" + request.getParameter("number-of-copies") +
                    ";number-of-side:" + request.getParameter("number-of-side") +
                    ";paper-size:" + request.getParameter("paper-size") +
                    ";paper-quality:" + request.getParameter("paper-quality") +
                    ";bookbinding:" + request.getParameter("bookbinding") +
                    ";bookbinding-method:" + request.getParameter("bookbinding-method") +
                    ";cover-quality:" + request.getParameter("cover-quality") +
                    ";extra-requirement:" + request.getParameter("extra-requirement");
            
 
            // Part list (multi files).
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && fileName.length() > 0) {
                    // File data
                    InputStream is = part.getInputStream();
                    // Write to file
                    this.writeToDB(conn, fileName, is, description, cus_id, name, phone, mail, address, price);
                }
            }
            conn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect(request.getContextPath() + "/order-success.jsp");
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
