package com.validator;

import com.beans.User;
import com.constants.AppContants;
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
    	User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        Part part=req.getPart("file");
        String fileType=part.getContentType();
        if(AppContants.ALLOWED_TYPES.contains(fileType)) {
        	String filename = "usrdp"+String.valueOf(user.getUserId())+getExtension(fileType);
        	FileOutputStream fout = null;
            InputStream fin = null;
            try {
                fin = part.getInputStream();
                byte[] images = new byte[fin.available()];
                fin.read(images);
                String path="C:\\maven_projects\\friendsbook\\src\\main\\webapp\\usersDp\\"+filename;
                fout = new FileOutputStream(path);
                fout.write(images);
                user.setDp(filename);
                if(UserDAO.dpUploaddao(user)){
                    resp.getWriter().println("image saved to database");
                }else{
                    resp.getWriter().println("image not  saved to database");

                }

            }catch (IOException e){
                resp.getWriter().println("Something went wrong File can't be uploaded.");
            }finally {
                try {
                    fout.flush();
                    fout.close();
                    fin.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }else {
        	System.out.println("Not Allowed");
        }
        
        

    }
    
    public static String getExtension(String type) {
    	return "."+type.split("/")[1];
    }
    
}
