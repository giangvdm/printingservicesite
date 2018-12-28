/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Khanh
 */
public class UserDAO {
//    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;" + "databaseName=PrintingService;" + "integratedSecurity=true";
//    private static final String USER_NAME = "sa";
//    private static final String PASSWORD = "12345";
    private static Connection conn;
    
//    public UserDAO(){
//        try {
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");                 
//            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
    public static boolean isUsernameTaken(String username){
        boolean status = false;  
        try{
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where userName=?");  
            ps.setString(1,username);  

            ResultSet result = ps.executeQuery();  
            status = result.next();  

        }catch(SQLException e){
            System.out.println(e);
        }  
        return status;  
    }
    
    public static boolean validate(String name, String pass){
        boolean status = false;  
        try{
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where userName=? and userPassword=?");  
            ps.setString(1,name);  
            ps.setString(2,pass);  

            ResultSet result = ps.executeQuery();  
            status = result.next();  

        }catch(SQLException e){
            System.out.println(e);
        }  
        return status;  
    }
    
    public static void addUser(User user){
        String query = "INSERT INTO [dbo].[User](fullname, userName, userPassword, email, address, phoneNumber) VALUES(?,?,?,?,?,?)";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getUserPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhoneNumber());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateUserInfo(User user){
        //Update user's fullname email address
        
        String query = "UPDATE [dbo].[User] SET fullname=?, email=?, address=? WHERE id=?";
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void changePassword(String password, User user){
        
    }
    
    public static User getUserByName(String username){
        User user = new User();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where userName=?");
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                user.setFullname(result.getString("fullname"));
                user.setEmail(result.getString("email"));
                user.setAddress(result.getString("address"));
                user.setPhoneNumber(result.getString("phoneNumber"));
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public static ArrayList<User> getAllUser(){
        ArrayList<User> userList = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[User]";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String username = result.getString("userName");
                String fullname = result.getString("fullname");
                String email = result.getString("email");
                String address = result.getString("address");
                String phoneNumber = result.getString("phoneNumber");
                
                User user = new User(id, username, fullname, email, address, phoneNumber);
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
}
