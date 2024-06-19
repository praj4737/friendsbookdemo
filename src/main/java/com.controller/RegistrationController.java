package com.controller;

import com.beans.User;
import com.business.UserAuthenticationBusiness;
import com.response.beans.UserRegistrationResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@WebServlet("/registerUser")
public class RegistrationController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fName=req.getParameter("firstName");
        String lName=req.getParameter("lastName");
        String gender=req.getParameter("gender");
        String email=req.getParameter("emailAddress");
        String password=req.getParameter("password");
        String confirmPassword=req.getParameter("confirmPassword");
        LocalDate dob= LocalDate.parse(req.getParameter("birthdayDate"));

        resp.getWriter().println(dob);
        if(confirmPassword.equals(password)){
           User user=new User(0,fName+" "+lName,gender,dob,email,password);
            UserAuthenticationBusiness business=new UserAuthenticationBusiness();
            UserRegistrationResponse response=new UserRegistrationResponse();
            business.userRegister(user,response);
            resp.getWriter().println(response.getError());
            resp.getWriter().println(response.getMessage());
            resp.getWriter().println(response.getStatus());
       }else{
            resp.getWriter().println("Password did not match");
        }
    }
}
