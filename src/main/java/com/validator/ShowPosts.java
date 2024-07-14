package com.validator;

import com.beans.Misc;
import com.beans.UserPost;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/fetchpost")
public class ShowPosts extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //resp.getWriter().write("hello");
        int numberOfPosts = 0;
        String json = null;

        UserPost[] post = new Misc().getPost();

        UserPost p = new UserPost();
        p = post[numberOfPosts];

        ObjectMapper objmapper = new ObjectMapper();
        try {
             json = objmapper.writeValueAsString(p);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        resp.getWriter().write(json);

        numberOfPosts+=1;



    }



}
