package com.beans;
import java.util.*;
public class OTPGenerater {

    public static String generateOTP() {
        String number = "1234567890";
        char[] otp = new char[4];
        int n;
        Random rand = new Random();

        for(int i=0;i<4;i++){
            otp[i] = number.charAt(rand.nextInt(number.length()));
        }

        return String.valueOf(otp);
    }

    }

