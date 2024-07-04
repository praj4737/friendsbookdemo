package com.beans;
import java.util.*;
public class OTPGenerater {

    public static int[] generateOTP() {
        String number = "1234567890";
        int[] otp = new int[4];
        int n;
        Random rand = new Random();

        for(int i=0;i<4;i++){
            otp[i] = (rand.nextInt((9-0)+1)+0);
        }
        for(int i=0;i<4;i++){
            System.out.println(otp[i]);
        }
        return otp;
    }

    }

