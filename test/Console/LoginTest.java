/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Console;

import DAO.UserDAO;
import java.util.Scanner;

/**
 *
 * @author Khanh
 */
public class LoginTest {
       public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        String username = input.nextLine();
        String password = input.nextLine();
        
//        String user = "hungdn";
//        String password = "ez4fnatic";
        
        if(UserDAO.validate(username, password)){
            System.out.println("Hello " + username);
        }
        else{
            System.out.println("Failed");
        }
    }
}
