package com.validator;

import com.beans.JsonConverter;
import com.beans.Misc;
import com.beans.User;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.cj.xdevapi.JsonArray;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addfriends")
public class AddFriends extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<User> users = new Misc().getUser();
        List<User> sublist= null;
        int size = users.size();
        int first =0;
        int last =5;

       if(last<size){

            sublist =  users.subList(first,last);
           first = first+5;
           last = last+5;

       }
       resp.setContentType("application/json");
       resp.setCharacterEncoding("UTF-8");
       PrintWriter out = resp.getWriter();
       out.write(JsonConverter.toJson(sublist));
       out.flush();
       out.close();






    }


}
