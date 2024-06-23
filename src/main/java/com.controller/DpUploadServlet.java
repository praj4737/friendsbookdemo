package com.controller;

import com.beans.User;
import com.dbutils.UserDAO;
import com.mysql.cj.exceptions.StreamingNotifiable;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/uploadDp")
@MultipartConfig
public class DpUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
        }else{
            Part part=req.getPart("file");
            resp.getWriter().println(part.getSubmittedFileName());
           String path = "C:\\friendsbookdemo\\src\\main\\webapp\\usersDp";
            String filename = "usrdp"+String.valueOf(user.getUserId())+".jpg";
            path = path+ File.separator+filename;
           FileOutputStream fout = null;
            InputStream fin = null;

            try {
                fin = part.getInputStream();
                byte[] images = new byte[fin.available()];
                fin.read(images);
                fout = new FileOutputStream(path);
                fout.write(images);

            }catch (IOException e){
                resp.getWriter().println("Something went wrong File can't be uploaded.");
            }finally {
                try {
                    //fout.flush();
                    fout.close();
                    fin.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }

            resp.getWriter().println("file uploaded successfully");
            user.setDp(path);

            if(UserDAO.dpUploaddao(user)){
                resp.getWriter().println("image saved to database");
            }else{
                resp.getWriter().println("image not  saved to database");

            }

        }

    }
}
