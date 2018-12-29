/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Order;
import Model.Request;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Khanh
 */
public class RequestDAO {
    private static Connection conn;

    public static void addRequest(Request request){
        String query = "INSERT INTO [dbo].[Request](customerName, email, phoneNumber, message, date) VALUES(?,?,?,?,?)";
        conn = ConnectionManager.getConnection();
        Calendar cal = Calendar.getInstance();
        Timestamp timestamp = new Timestamp(cal.getTimeInMillis());
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, request.getCustomerName());
            ps.setString(2, request.getEmail());
            ps.setString(3, request.getPhoneNumber());
            ps.setString(4, request.getMessage());
            ps.setTimestamp(5, timestamp);
            ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static ArrayList<Request> selectAllRequest(){
        ArrayList<Request> req = new ArrayList<Request>();
        String query = "SELECT * FROM [dbo].[Request]";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String cus_name = result.getString("customerName");
                String cus_tel = result.getString("phoneNumber");
                String cus_mail = result.getString("email");
                String message = result.getString("message");
                Timestamp date = result.getTimestamp("date");
                String status = result.getString("status");
                
                Request temp = new Request(id, cus_name, cus_mail, cus_mail, message, date);
                req.add(temp);            
            }
        }catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return req;
    }
}