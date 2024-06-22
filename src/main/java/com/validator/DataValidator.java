package com.validator;

import com.beans.User;
import com.constants.AppContants;
import com.constants.CommonErros;
import com.dbutils.UserDAO;
import com.response.beans.UserRegistrationResponse;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DataValidator {
    public  static boolean validateUserData(User user, UserRegistrationResponse response){
        if(isName(user.getUserName(), response)){
            if(isEmail(user.getEmail(),response)){
                if(isAgeEighteenPlus(user.getDob(),response) && !isEmailExis(user.getEmail(),response)){
                    return true;
                }
            }
        }
        return false;

    }
    private static boolean isName(String name, UserRegistrationResponse response){
        if(name.matches(AppContants.NAME_REGEX)){
            return true;
        }
        response.updateResponse(CommonErros.INVALID_NAME, CommonErros.BAD_REQUEST,null);
        return false;
    }
    private static boolean isEmail(String email, UserRegistrationResponse response){
        if(email.matches(AppContants.EMAIL_REGEX)){
            return true;
        }
        response.updateResponse(CommonErros.INVALID_EMAIL, CommonErros.BAD_REQUEST,null);
        return false;
    }
    private static boolean isAgeEighteenPlus(LocalDate dob, UserRegistrationResponse response){
        long years= ChronoUnit.YEARS.between(dob, LocalDate.now());
        if(years>=18){
            return true;
        }
        response.updateResponse(CommonErros.AGE_BELOW_EIGHTEEN, CommonErros.BAD_REQUEST,null);
        return false;
    }
    private static boolean isEmailExis(String email, UserRegistrationResponse response){
        if(UserDAO.isEmailExistInDB(email)){
            response.updateResponse(CommonErros.EMAIL_ALREADY_EXIST, CommonErros.BAD_REQUEST,null);
            return true;
        }
        return false;
    }
}
