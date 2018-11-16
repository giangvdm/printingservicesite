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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User(String fullname, String userName, String userPassword, String email, String address) {
        this.fullname = fullname;
        this.userName = userName;
        this.userPassword = userPassword;
        this.email = email;
        this.address = address;
    }
    
    public User(String fullname, String userName, String userPassword, String email) {
        this.fullname = fullname;
        this.userName = userName;
        this.userPassword = userPassword;
        this.email = email;
    }


    public User(int id, String fullname, String userName, String userPassword, String email) {
        this.id = id;
        this.fullname = fullname;
        this.userName = userName;
        this.userPassword = userPassword;
        this.email = email;
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

}