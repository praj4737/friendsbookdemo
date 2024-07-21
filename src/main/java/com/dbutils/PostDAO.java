package com.dbutils;

import com.beans.JsonConverter;
import com.beans.User;
import com.beans.UserPost;
import com.constants.AppContants;
import com.constants.CommonErros;
import com.response.beans.ShowPostResponse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    public static List<UserPost> getPosts(User user, int limit,int offest,ShowPostResponse response) {
        Connection con=null;
        Statement st=null;
        ResultSet rd=null;
        List<UserPost> posts=null;
        UserPost post=null;

        try{
            con=DBUtils.getDbConnection();
            st= con.createStatement();
            String query="select u.name,u.userId,p.caption,p.imageAddr,p.likes,p.comments,p.start_date from user_post p join users u on p.userId = u.userId where p.userId = "+user.getUserId()+" or p.userId in (select friend_user_id from friends where userId = "+user.getUserId()+" union select userId from friends where friend_user_id = "+user.getUserId()+")order by p.start_date desc limit  "+limit+" offset  "+offest+";";
            rd=st.executeQuery(query);
            if(rd!=null){
                posts=new ArrayList<>();

                while(rd.next()){
                    post=new UserPost();
                    post.setUsername(rd.getString(1));
                    post.setUserId(rd.getInt(2));
                    post.setCaption(rd.getString(3));
                    post.setImage(rd.getString(4));
                    post.setLikes(rd.getInt(5));
                    post.setComments(rd.getInt(6));
                    post.setDateOfPost(rd.getDate(7).toLocalDate());
                    posts.add(post);

                }

            }
            if(posts!=null && posts.size()>0){
                response.setStatus(AppContants.SUCCESS_CODE);
                response.setMessage(AppContants.OK);
                response.setData(JsonConverter.toJson(posts));
            }else{
                response.setStatus(CommonErros.BAD_REQUEST);
                response.setMessage(CommonErros.FAILED);
                response.setData(null);
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
