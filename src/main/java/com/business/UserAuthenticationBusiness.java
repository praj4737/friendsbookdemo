package com.business;

import com.beans.User;
import com.constants.AppContants;
import com.dbutils.UserDAO;
import com.response.beans.UserRegistrationResponse;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.regex.Pattern;

public class UserAuthenticationBusiness {
    public void authenticateUsers(User user){

    }
    public  boolean userRegister(User user, UserRegistrationResponse response){
        boolean result =false;
        // Name is not black
        if(validateName(user.getUserName())){
            //validate age
            if(isUserAgeValidForFB(user.getDob())){
                if(isValidEmail(user.getEmail(),response)){
                    String[] query=generateQuery(user);
                    UserDAO.registerUser(query[0],response);
                    UserDAO.registerUser(query[1],response);
                    if(response.getMessage().equals("Data Saved Successfully")){
                        response.setMessage("User Registered Successfully");
                        return true;
                    }
                }else{
                    return false;
                }
            }else{
                response.setError("User is not 18+");
                return false;
            }
        }else{
            response.setError("User entered wrong or blank name");
            return false;
        }
        return false;
    }
    private boolean validateName(String name){
        if(null!=name && name.length()>0){
            return true;
        }
        return false;
    }
    private boolean isUserAgeValidForFB(LocalDate dob){
        long years= ChronoUnit.YEARS.between(dob, LocalDate.now());
        return (years>=18)?true:false;
    }
    private boolean isValidEmail(String email, UserRegistrationResponse response){
        boolean result=false;
        if(Pattern.matches(AppContants.EMAIL_REGEX,email)){
            if(!UserDAO.isEmailExistInDB(email)){
                return true;
            }else {

                response.setError("Email Already Exist");
                return false;
            }
        }else{

            response.setError("Email is not a valid email address");
            return false;
        }

    }
    private String[] generateQuery(User user){
        String[] query=new String[2];
        user.setUserId(UserDAO.getCorrespondigId("users")+1);
        query[0]="insert into users values("+user.getUserId()+",'"+user.getEmail()+"','"+user.getUserName()+"','"+user.getGender()+"','"+user.getDob()+"');";
        query[1]="insert into creds values("+(UserDAO.getCorrespondigId("creds")+1)+","+user.getUserId()+",'"+user.getPassword()+"','"+LocalDate.now()+"',null);";
        return query;
    }
}
