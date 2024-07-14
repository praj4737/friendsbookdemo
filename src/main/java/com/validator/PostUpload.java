package com.validator;

import com.beans.User;
import com.beans.UserPost;
import com.constants.AppContants;
import com.dbutils.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;

@WebServlet("/postupload")
@MultipartConfig

public class PostUpload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("index.jsp");
        }
        //let's set post details here
        UserPost post = new UserPost();
        post.setPostId("post2");
        post.setCaption(req.getParameter("caption"));
        post.setDateOfPost(LocalDate.now());

        //post details setting end here
        Part part=req.getPart("picFile");
        String fileType=part.getContentType();
        if(AppContants.ALLOWED_TYPES.contains(fileType)) {
            String filename = "usrpost"+String.valueOf(user.getUserId())+getExtension(fileType);
            FileOutputStream fout = null;
            InputStream fin = null;
            try {
                fin = part.getInputStream();
                byte[] images = new byte[fin.available()];
                fin.read(images);
                String path="C:\\\\friendsbookdemo\\\\src\\\\main\\\\webapp\\\\images\\\\"+filename;
                post.setImage(path);
                user.setUserPost(post);
                fout = new FileOutputStream(path);
                fout.write(images);
                user.setDp(filename);
                if(UserDAO.makePost(user)){
                    resp.getWriter().println("Post is successfully uploaded");
                }else{
                    resp.getWriter().println("Post upload failed");

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

