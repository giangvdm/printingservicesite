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
        
        String query = "UPDATE [dbo].[User] SET fullname=?, email=?, phoneNumber=?, address=? WHERE id=?";
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void adminUpdateUserInfo(User user){
        
        String query = "UPDATE [dbo].[User] SET userName=?, userPassword=?, fullname=?, email=?, phoneNumber=?, address=? WHERE id=?";
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getUserPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAddress());
            ps.setInt(7, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void changePassword(User user) {
        String query = "UPDATE [dbo].[User] SET userPassword=? WHERE id=?";
        
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getUserPassword());
            ps.setInt(2, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static User getUserByName(String username){
        User user = new User();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where userName=?");
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                user.setId(result.getInt("id"));
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
    
    public static User getUserById(int id){
        User user = new User();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                user.setId(result.getInt("id"));
                user.setUserName(result.getString("userName"));
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
    
    public static User adminGetUserById(int id){
        User user = new User();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[User] where id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                user.setId(result.getInt("id"));
                user.setUserName(result.getString("userName"));
                user.setUserPassword(result.getString("userPassword"));
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
    
    public static String getUserPasswordById(int id){
        User user = new User();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select userPassword from [dbo].[User] where id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                user.setUserPassword(result.getString("userPassword"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user.getUserPassword();
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
                
                User user = new User(id, username, fullname, email, phoneNumber, address);
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
    
    public static ArrayList<User> getUser(int limit){
        ArrayList<User> userList = new ArrayList<>();
        String query = "SELECT TOP(?) * FROM [dbo].[User]";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, limit);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String username = result.getString("userName");
                String fullname = result.getString("fullname");
                String email = result.getString("email");
                String address = result.getString("address");
                String phoneNumber = result.getString("phoneNumber");
                
                User user = new User(id, username, fullname, email, phoneNumber, address);
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
    
    public static void deleteUser(User user){
        String query = "DELETE FROM [dbo].[User] WHERE id=?";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}