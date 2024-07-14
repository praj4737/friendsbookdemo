package com.validator;

import java.util.regex.Pattern;

public class test {
    public static void main(String[] args) {
        String passPattern ="^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$";
        String pass="pasPdddd777777s1";
        System.out.println(pass.matches(passPattern));
    }
}
