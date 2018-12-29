/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Console;

import DAO.UserDAO;
import Model.User;
import java.util.ArrayList;

/**
 *
 * @author Khanh
 */
public class GetUserTest {
    public static void main(String[] args) {
        ArrayList<User> userList = UserDAO.getAllUser();
        for (int i = 0; i < userList.size(); i++) {
            System.out.println(userList.get(i).getUserName());
            
        }
    }
}
