package com.constants;

public class AppContants {
    public static final String EMAIL_REGEX="^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
    public static final String NAME_REGEX="^[A-Za-z ]*$";
    public static final String MOBILE_REGEX="[7-9][0-9]{9}$";
    public static final String USER_REGISTERED="User Registered Successfully";
    public static final String SUCCESS_CODE="200";
    public static final String ALLOWED_TYPES="image/jpeg, image/png";
    public static final String PASSWORD_REGEX ="^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{8,}$";
}
