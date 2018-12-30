/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author Khanh
 */
public class Request {
    int id;
    String customerName;
    String email;
    String phoneNumber;
    String message;
    Timestamp sendDate;
    String status;

    public Request(int id, String customerName, String email, String phoneNumber, String message, Timestamp date) {
        this.id = id;
        this.customerName = customerName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
        this.sendDate = date;
    }

    public Request() {
    }

    public Request(String customerName, String email, String phoneNumber, String message, Timestamp date) {
        this.customerName = customerName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
        this.sendDate = date;
    }

    public Request(int id, String customerName, String email, String phoneNumber, String message, Timestamp sendDate, String status) {
        this.id = id;
        this.customerName = customerName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
        this.sendDate = sendDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getSendDate() {
        return sendDate;
    }

    public void setSendDate(Timestamp date) {
        this.sendDate = date;
    }

    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}
