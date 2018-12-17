/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Console;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author Khanh
 */
public class VNTest {
    public static void main(String[] args) {
        String name = "V? ?? Minh Giang";
        byte[] byteBuff = name.getBytes(StandardCharsets.UTF_8);
        System.out.println(name);
    }
}
