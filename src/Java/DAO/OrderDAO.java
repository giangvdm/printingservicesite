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

    public static void changeOrderStatus(String status, int id){
        String query = "UPDATE [dbo].[Order] SET status =? WHERE id = ?;";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public static void deleteOrderById(int id){
        String query = "DELETE FROM [dbo].[Order] WHERE id=?";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
       
    public static ArrayList<Order> SelectOrderByName(String clientName){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM [dbo].[Order] WHERE cus_name=?";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, clientName);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_mail");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, cus_name, description, status, date, total);
                orders.add(temp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
        public static ArrayList<Order> SelectOrderByStatus(String status){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM [dbo].[Order] WHERE status=?";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_mail");
                Timestamp date = result.getTimestamp("date");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, cus_name, description, status, date, total);
                orders.add(temp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public static ArrayList<Order> selectAllOrder(){
        ArrayList<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM [dbo].[Order]";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String filename = result.getString("filename");
                String description = result.getString("description");
                String cus_name = result.getString("cus_name");
                String cus_tel = result.getString("cus_tel");
                String cus_mail = result.getString("cus_mail");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                int total = result.getInt("total");
                
                Order temp = new Order(id, filename, cus_name, description, status, date, total);
                orders.add(temp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;        
    }
}