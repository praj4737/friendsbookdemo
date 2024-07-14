package com.validator;

import com.beans.JsonConverter;
import com.beans.OTPGenerater;
import com.beans.User;
import com.constants.AppContants;
import com.constants.CommonErros;
import com.dbutils.UserDAO;
import com.response.beans.UserRegistrationResponse;
import com.validator.DataValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Pattern;

@WebServlet("/registerUser")
public class RegistrationController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ((HttpServletResponse) resp).addHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
        ((HttpServletResponse) resp).addHeader("Access-Control-Allow-Headers", "*");
        ((HttpServletResponse) resp).addHeader("Access-Control-Allow-Methods",
                "GET, OPTIONS, HEAD, PUT, POST, DELETE");
        String fName=req.getParameter("firstName");
        String lName=req.getParameter("lastName");
        String gender=req.getParameter("gender");
        String email=req.getParameter("emailAddress");
        String password=req.getParameter("password");
        String confirmPassword=req.getParameter("confirmPassword");
        LocalDate dob= LocalDate.parse(req.getParameter("birthdayDate"));

        UserRegistrationResponse response=new UserRegistrationResponse();

        if(confirmPassword.equals(password)){
            User user=new User(UserDAO.getCorrespondigId("users"),fName+" "+lName,gender,dob,email,password,null);
            if(DataValidator.validateUserData(user,response)){
                HttpSession session=req.getSession();
                session.setAttribute("user",user);
                String otp= OTPGenerater.generateOTP();
                System.out.println(otp);
                session.setAttribute("otp",otp);
                response.setMessage("Verify through OTP");
                response.setStatus(AppContants.SUCCESS_CODE);
            }

        }else{
            response.updateResponse(CommonErros.PASSWORD_NOT_MATCHED,CommonErros.BAD_REQUEST,null);
        }
        String jsonResponse = JsonConverter.toJson(response);
        resp.getWriter().print(jsonResponse);
    }


}
