/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Khanh
 */
public class Order implements Serializable{
    int id;
    String filename;
    String description;
    String status;
    Timestamp date;
    int total;
    int customerId;
    String customerName;
    String customerEmail;
    String customerPhone;
    String customerAddress;

    public Order(int id, String filename, String description, String status, Timestamp date, int total, int customerId, String customerName, String customerEmail, String customerPhone, String customerAddress) {
        this.id = id;
        this.filename = filename;
        this.description = description;
        this.status = status;
        this.date = date;
        this.total = total;
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
    }

    public Order(int id, String description, int total, String customerName, String customerEmail, String customerPhone, String customerAddress) {
        this.id = id;
        this.description = description;
        this.total = total;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
    }

    public Order() {
    }

    public Order(String filename, String description, String status, Timestamp date, int total, String customerName, String customerEmail, String customerPhone, String customerAddress) {
        this.filename = filename;
        this.description = description;
        this.status = status;
        this.date = date;
        this.total = total;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
    }

    public Order(String filename, String description, String status, Timestamp date, int total, int customerId, String customerName, String customerEmail, String customerPhone, String customerAddress) {
        this.filename = filename;
        this.description = description;
        this.status = status;
        this.date = date;
        this.total = total;
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    
    
}
