/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Khanh
 */
public class DownloadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String fileName;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       Connection conn = null;
       try {
           // Lấy ra kết nối tới Database.
           // (Xem thêm tài liệu JDBC)
           conn = ConnectionManager.getConnection();
           Long id = null;
           try {
               id = Long.parseLong(request.getParameter("id"));
           } catch (Exception e) {
 
           }
            Blob attachment = getAttachmentFromDB(conn, id);
            InputStream is = attachment.getBinaryStream();
 
           // file1.zip, file2.zip
           
           System.out.println("File Name: " + fileName);
 
           // abc.txt => text/plain
           // abc.zip => application/zip
           // abc.pdf => application/pdf
           String contentType = this.getServletContext().getMimeType(fileName);
           System.out.println("Content Type: " + contentType);
 
           response.setHeader("Content-Type", contentType);
 
           response.setHeader("Content-Length", String.valueOf(attachment.length()));
 
           response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
 
    
           // Với các file attachment dung lượng lớn
           // nên đọc và ghi lần lượt
 
           byte[] bytes = new byte[1024];
           int bytesRead;
 
           while ((bytesRead = is.read(bytes)) != -1) {
               // Ghi dữ liệu ảnh vào Response.
               response.getOutputStream().write(bytes, 0, bytesRead);
           }
           is.close();
 
       } catch (Exception e) {
           throw new ServletException(e);
       } finally {
           this.closeQuietly(conn);
       }
   
    }
    
       private Blob getAttachmentFromDB(Connection conn, Long id) throws SQLException {
            String sql = "SELECT * FROM [dbo].[Order] WHERE id=? ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                fileName = rs.getString("filename");
                Blob fileData = rs.getBlob("filedata");
                InputStream is = fileData.getBinaryStream();
                return fileData;
            }
       return null;
   }
 
   private void closeQuietly(Connection conn) {
       try {
           if (conn != null) {
               conn.close();
           }
       } catch (Exception e) {
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