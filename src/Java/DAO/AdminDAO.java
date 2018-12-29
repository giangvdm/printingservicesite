package DAO;

import Model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author giang
 */
public class AdminDAO {
    
    private static Connection conn;
    
    public static void addAdmin(Admin admin){
        String query = "INSERT INTO [dbo].[Admin](username, password) VALUES(?,?)";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            
            ps.executeUpdate();
            ps.close();
            conn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static boolean verify(String name, String pass){
        boolean status = false;  
        try{
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Admin] where username=? and password=?");  
            ps.setString(1, name);  
            ps.setString(2, pass);  

            ResultSet result = ps.executeQuery();  
            status = result.next();  

        }catch(SQLException e){
            System.out.println(e);
        }  
        return status;
    }
    
    public static void editAdminInfo(Admin admin){
        
        String query = "UPDATE [dbo].[Admin] SET username=?, password=? WHERE id=?";
        try {
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setInt(3, admin.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Admin getAdminByUsername(String username) {
        Admin admin = new Admin();
        
        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Admin] where username=?");
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                admin.setUsername(username);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return admin;
    }
    
    public static Admin getAdminById(int id){
        Admin admin = new Admin();

        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Admin] where id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                admin.setId(result.getInt("id"));
                admin.setUsername(result.getString("username"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return admin;
    }
    
    public static boolean isUsernameTaken(String username){
        boolean status = false;  
        try{
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Admin] where username=?");  
            ps.setString(1, username);  

            ResultSet result = ps.executeQuery();
            status = result.next();
            
        } catch(SQLException e) {
            System.out.println(e);
        }  
        return status;  
    }
    
    public static ArrayList<Admin> getAllAdmin(){
        ArrayList<Admin> userList = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Admin]";
        conn = ConnectionManager.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet result = ps.executeQuery();  
            while(result.next()){
                int id = result.getInt("id");              
                String username = result.getString("username");
                String password = result.getString("password");
                
                Admin admin = new Admin(id, username, password);
                userList.add(admin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
    
    public static void deleteAdmin(Admin admin){
        String query = "DELETE FROM [dbo].[Admin] WHERE id=?";
        try {         
            conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, admin.getId());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
