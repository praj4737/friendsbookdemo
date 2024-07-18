package com.dbutils;

import com.beans.User;
import com.beans.UserPost;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    public static List<UserPost> getPosts(User user){
        Connection con=null;
        Statement st=null;
        ResultSet rd=null;
        List<UserPost> posts=null;
        try{
            con=DBUtils.getDbConnection();
            st= con.createStatement();
            String query="select * from user_post where userId in ("+user.getUserId()+")";
            rd=st.executeQuery(query);
            if(rd!=null){
                posts=new ArrayList<>();

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                con.close();
                st.close();rd.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return posts;
    }


}
