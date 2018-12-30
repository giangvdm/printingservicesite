/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Order;
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
 * @author Khanh
 */
public class OrderDAO {
    private static Connection conn;
    
    public static void deleteOrderById(int id){
        String query = "DELETE FROM [dbo].[Order] WHERE id=?";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static Order selectOrderById(int id){
        String query = "SELECT * FROM [dbo].[Order] WHERE id=?";
        conn = ConnectionManager.getConnection();
        Order temp = new Order();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                String filename = result.getString("filename");
                String description = result.getString("description");
                int cus_id = result.getInt("cus_id");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_email");
                String cus_address = result.getString("cus_address");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                temp = new Order(id, filename, description, status, date, total, cus_id, cus_name, cus_mail, cus_tel, cus_address);
            }                        
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
    
    public static ArrayList<Order> selectOrderByCustomerId(int customerId){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM [dbo].[Order] WHERE cus_id=? ORDER BY date DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                int cus_id = result.getInt("cus_id");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_email");
                String cus_address = result.getString("cus_address");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, description, status, date, total, cus_id, cus_name, cus_mail, cus_tel, cus_address);
                orders.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public static ArrayList<Order> selectOrderByStatus(String status){
    ArrayList<Order> orders = new ArrayList<Order>();
    String query = "SELECT * FROM [dbo].[Order] WHERE status=? ORDER BY date DESC";
    conn = ConnectionManager.getConnection();
    try {
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, status);
        ResultSet result = ps.executeQuery();  
        while(result.next()){
            int id = result.getInt("id");              
            String filename = result.getString("filename");
            String description = result.getString("description");
            int cus_id = result.getInt("cus_id");
            String cus_name = result.getString("cus_name");
            String cus_tel = result.getString("cus_tel");
            String cus_mail = result.getString("cus_email");
            String cus_address = result.getString("cus_address");
            Timestamp date = result.getTimestamp("date");
            int total = result.getInt("total");

            Order temp = new Order(id, filename, description, status, date, total, cus_id, cus_name, cus_mail, cus_tel, cus_address);
            orders.add(temp);
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orders;
}
    
    public static ArrayList<Order> selectAllOrder(){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM [dbo].[Order] ORDER BY date DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                int cus_id = result.getInt("cus_id");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_email");
                String cus_address = result.getString("cus_address");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, description, status, date, total, cus_id, cus_name, cus_mail, cus_tel, cus_address);
                orders.add(temp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;        
    }
    
    public static ArrayList<Order> selectPendingOrders(int limit){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT TOP(?) * FROM [dbo].[Order] ORDER BY date DESC";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt((1), limit);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                int cus_id = result.getInt("cus_id");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_email");
                String cus_address = result.getString("cus_address");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, description, status, date, total, cus_id, cus_name, cus_mail, cus_tel, cus_address);
                orders.add(temp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;        
    }
    
    public static void changeStatus(Order order, String newStatus) {
        String query = "UPDATE [dbo].[Order] SET status=? WHERE id=?";
        
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setInt(2, order.getId());
            
            ps.executeUpdate();
        }
        catch (SQLException ex) {}
    }
    
    public static void updateOrderInfo(Order order){
        
        String query = "UPDATE [dbo].[Order] SET description=?,total=?,cus_name=?,cus_email=?,cus_tel=?,cus_address=? WHERE id=?";
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, order.getDescription());
            ps.setInt(2, order.getTotal());
            ps.setString(3, order.getCustomerName());
            ps.setString(4, order.getCustomerEmail());
            ps.setString(5, order.getCustomerPhone());
            ps.setString(6, order.getCustomerAddress());
            ps.setInt(7, order.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
