/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Khanh
 */
public class ConnectionManager {
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;" + "databaseName=PrintingService;" + "–Djava.libary.path=<path>C:\\Program Files\\Microsoft JDBC Driver 7.0 for SQL Server\\sqljdbc_7.0\\enu\\auth\\x64" + "integratedSecurity=true";
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "12345";
    private static Connection conn;
    
    public static Connection getConnection(){
        try {                 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}
