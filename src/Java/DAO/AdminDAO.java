package DAO;

import Model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public static Admin getAdminByUsername(String username) {
        Admin admin = new Admin();
        
        try {
            conn = ConnectionManager.getConnection();  
            PreparedStatement ps = conn.prepareStatement("select * from [dbo].[Admin] where username=?");
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                admin.setPassword(result.getString("password"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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

        }catch(SQLException e){
            System.out.println(e);
        }  
        return status;  
    }
}
