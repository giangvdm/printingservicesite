/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Console;

import DAO.UserDAO;
import Model.User;
import java.util.Scanner;

/**
 *
 * @author Khanh
 */
public class RegisterTest {
    public static void main(String[] args) {
//        Scanner input = new Scanner(System.in);
//        
//        System.out.println("Enter username: ");
//        String username = input.nextLine();
//        System.out.println("Enter password: ");
//        String password = input.nextLine();
//        System.out.println("Enter full name: ");
//        String fullname = input.nextLine();
//        System.out.println("Enter email: ");
//        String email = input.nextLine();
//        
        User user = new User("Nguyen Van B", "abcde", "bnguyen", "RushB@gmail.com");
        UserDAO ud = new UserDAO();
        ud.addUser(user);
                                
    }
}
