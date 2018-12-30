package DAO;

import Model.Request;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vumin
 */
public class RequestDAO {
    private static Connection conn;
    
    public static void addRequest(Request contactRequest){
        String query = "INSERT INTO [dbo].[Request](customerName, customerEmail, customerPhone, message, sendDate, status) VALUES(?,?,?,?,?,?)";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, contactRequest.getCustomerName());
            ps.setString(2, contactRequest.getEmail());
            ps.setString(3, contactRequest.getPhoneNumber());
            ps.setString(4, contactRequest.getMessage());
            ps.setTimestamp(5, contactRequest.getSendDate());
            ps.setString(6, "pending");
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void changeStatus(Request contactRequest, String newStatus) {
        String query = "UPDATE [dbo].[Request] SET status=? WHERE id=?";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setInt(2, contactRequest.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<Request> getAllPendingRequests(){
        ArrayList<Request> pendingRequestList = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Request] WHERE status=? ORDER BY sendDate DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "pending");
            ResultSet result = ps.executeQuery();
            
            while(result.next()) {
                int id = result.getInt("id");
                String customerName = result.getString("customerName");
                String customerEmail = result.getString("customerEmail");
                String customerPhone = result.getString("customerPhone");
                String message = result.getString("message");
                Timestamp sendDate = result.getTimestamp("sendDate");
                String status = result.getString("status");
                
                Request contactRequest = new Request(id, customerName, customerEmail, customerPhone, message, sendDate, status);
                pendingRequestList.add(contactRequest);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pendingRequestList;
    }
    
    // used by Admin Dashboard
    public static ArrayList<Request> getPendingRequests(int limit){
        ArrayList<Request> pendingRequestList = new ArrayList<>();
        String query = "SELECT TOP(?) * FROM [dbo].[Request] WHERE status=? ORDER BY sendDate DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, limit);
            ps.setString(2, "pending");
            ResultSet result = ps.executeQuery();
            
            while(result.next()) {
                int id = result.getInt("id");
                String customerName = result.getString("customerName");
                String customerEmail = result.getString("customerEmail");
                String customerPhone = result.getString("customerPhone");
                String message = result.getString("message");
                Timestamp sendDate = result.getTimestamp("sendDate");
                String status = result.getString("status");
                
                Request contactRequest = new Request(id, customerName, customerEmail, customerPhone, message, sendDate, status);
                pendingRequestList.add(contactRequest);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pendingRequestList;
    }
    
    public static ArrayList<Request> getAllCompletedRequests(){
        ArrayList<Request> completedRequestList = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Request] WHERE status=? ORDER BY sendDate DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "completed");
            ResultSet result = ps.executeQuery();
            
            while(result.next()) {
                int id = result.getInt("id");   
                String customerName = result.getString("customerName");
                String customerEmail = result.getString("customerEmail");
                String customerPhone = result.getString("customerPhone");
                String message = result.getString("message");
                Timestamp sendDate = result.getTimestamp("sendDate");
                String status = result.getString("status");
                
                Request contactRequest = new Request(id, customerName, customerEmail, customerPhone, message, sendDate, status);
                completedRequestList.add(contactRequest);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return completedRequestList;
    }
    
    public static Request getContactRequestById(int id) {
        Request contactRequest = new Request();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Request] where id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                contactRequest.setId(result.getInt("id"));
                contactRequest.setCustomerName(result.getString("customerName"));
                contactRequest.setEmail(result.getString("customerEmail"));
                contactRequest.setPhoneNumber(result.getString("customerPhone"));
                contactRequest.setMessage(result.getString("message"));
                contactRequest.setSendDate(result.getTimestamp("sendDate"));
                contactRequest.setStatus(result.getString("status"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactRequest;
    }
    
    public static void deleteContactRequest(Request contactRequest){
        String query = "DELETE FROM [dbo].[Request] WHERE id=?";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, contactRequest.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
