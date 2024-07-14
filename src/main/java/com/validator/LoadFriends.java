package com.validator;

import com.beans.Misc;
import com.beans.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/loadfriends")
public class LoadFriends extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String json= null;
        User users[] = null;
        users = new Misc().getUser();

        int count = 0;

        ObjectMapper mapper = new ObjectMapper();
        try {

              json = mapper.writeValueAsString(users);


        }catch (JsonProcessingException jpe){
            jpe.printStackTrace();
        }
        resp.getWriter().write(json);
    }
}
