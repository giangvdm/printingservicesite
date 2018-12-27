/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Console;

import DAO.UserDAO;
import Model.User;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author Khanh
 */
public class VNTest {
    public static void main(String[] args) {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMDD HH:MM:SS");
        String time = sdf.format(cal.getTime());
        
        System.out.println(time);
        
    }
}
