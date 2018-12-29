/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Khanh
 */
public class User {
    int id;
    String fullname;
    String userName;
    String userPassword;
    String email;
    String address;
    String phoneNumber;
    String userType;

    public boolean isValid;

    public User(int id, String username, String fullname, String email, String address, String phoneNumber) {
        this.id = id;
        this.userName = username;
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public User() {
        
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User(String fullname, String userName, String userPassword, String email, String address, String phoneNumber) {
        this.fullname = fullname;
        this.userName = userName;
        this.userPassword = userPassword;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }
    
    public User(int id, String fullname, String email, String phoneNumber, String address) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
    
    public User(int id, String password) {
        this.id = id;
        this.userPassword = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
