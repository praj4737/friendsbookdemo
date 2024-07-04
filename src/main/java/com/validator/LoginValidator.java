package com.validator;

import com.beans.User;
import com.constants.AppContants;
import com.constants.CommonErros;
import com.dbutils.UserDAO;
import com.response.beans.UserLoginResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/login")
public class LoginValidator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        UserLoginResponse response = new UserLoginResponse();

        String email = null;
        String password = null;

        email = req.getParameter("email");
        password = req.getParameter("password");

        if(email.matches(AppContants.EMAIL_REGEX)){
            if(UserDAO.LoginDao(email, password)){
                response.setStatus(AppContants.SUCCESS_CODE);
                HttpSession session = req.getSession();
                User user = UserDAO.getUser(email);
                session.setAttribute("user", user);
                resp.sendRedirect("HomePage.jsp");

            }else{
                response.setStatus(CommonErros.BAD_REQUEST);
                response.setError(CommonErros.LOGIN_FAILED);
                req.setAttribute("response",response);
                RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                rd.forward(req, resp);
            }
           // if(password.matches(AppContants.PASSWORD_REGEX)){
           //     out.println("password and email is valid atleast.");
            // }else{
             //   out.println("password is invalid");
          //  }
        }else{
            response.setStatus(CommonErros.BAD_REQUEST);
            response.setError(CommonErros.INVALID_EMAIL);
            req.setAttribute("response",response);
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.forward(req, resp);
        }
    }
}
