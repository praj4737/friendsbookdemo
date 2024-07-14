package com.validator;
import java.beans.Beans;
import java.io.File;
import java.io.IOException;

import com.beans.OTPGenerater;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMultipart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.mail.*;
import java.util.Properties;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;



@WebServlet("/mailme")

public class OTPvalidaterForEmail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String to = "raj9301560@gmail.com";
        final String user="pranav7061597110@gmail.com";
        final String pass="spsb qjnb jxzx hnob";
        String subject = "FriendsBook";
        String otp = OTPGenerater.generateOTP();
        String msg = "OTP for Validation is: "+otp;






        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user,pass);
                    }
                });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject(subject);
            message.setText(msg);


            Transport.send(message);

           resp.getWriter().println("mail sent.");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
