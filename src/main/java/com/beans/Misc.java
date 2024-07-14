package com.beans;

import com.dbutils.UserDAO;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Misc {

    public UserPost[] getPost(){

        UserPost[] posts = null;

        ResultSet rs = null;
        rs = UserDAO.fetchPost();
        int numberOfPosts = Integer.MIN_VALUE;
        UserPost p = new UserPost();
        User user = new User();
        int i=0;
        try {
            rs.last();
            numberOfPosts = rs.getRow();
            rs.first();
            posts = new UserPost[numberOfPosts];

            while (i!=numberOfPosts) {

                p.setPostId(rs.getString(1));
                int userId = rs.getInt(2);
                //user = UserDAO.getUser(userId);
                p.setCaption(rs.getString(3));
                p.setImage(rs.getString(4));
                p.setLikes(rs.getInt(5));
                p.setComments(rs.getInt(6));
                p.setShares(rs.getInt(7));
               // p.setDateOfPost(rs.getDate(8).toLocalDate());
               // p.setTimeOfPost(rs.getTime(9).toLocalTime());

                posts[i] = p;
                i++;
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return posts;
    }
    public User[] getUser(){
        User[] users = null;
        ResultSet rs = null;
        int numberOfUsers = 0;
        int i=0;
        User user = new User();
        rs = UserDAO.fetchFriends();
        try {
            rs.last();
            numberOfUsers = rs.getRow();
            rs.first();
            users = new User[numberOfUsers];

            while(i!= numberOfUsers ) {
                user.setUserId(rs.getInt(1));
                user.setUserName(rs.getString(3));
                user.setDp(UserDAO.getUserDp(user.getUserId()));
                users[i] = user;
                i+=1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



        return users;
    }
}















