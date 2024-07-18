package com.dbutils;

import com.beans.User;
import com.beans.UserPost;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FriendsDAO {
    public static List<User> getListOfPeopleYouMayKnow(User user){
        Connection con=null;
        Statement st=null;
        ResultSet rd=null;
        List<User> peopleYouMayKnow=null;

        try {
            con=DBUtils.getDbConnection();
            st= con.createStatement();
            String query="select users.userId,users.name,users.gender,users.dob,users.email,dp.imageUrl from users\n" +
                    "left join dp_table dp on dp.userId=users.userId\n" +
                    "where users.userId not in (select friend_user_id from friends where userId="+user.getUserId()+");";
            rd=st.executeQuery(query);
            if(rd!=null){
                peopleYouMayKnow=new ArrayList<>();
                while(rd.next()){
                    User u=new User();
                    u.populateBasicUserInfo(rd.getInt(1),
                            rd.getString(2),
                            rd.getString(3),
                            rd.getDate(4).toLocalDate(),
                            rd.getString(5),
                            rd.getString(6));
                    peopleYouMayKnow.add(u);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                con.close();
                st.close();
                rd.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return peopleYouMayKnow;
    }

    public static void main(String[] args) {
        User u=new User();
        u.setUserId(1);
        List<User> users=getListOfPeopleYouMayKnow(u);
        for(User user:users){
            System.out.println(user.getUserId()+" "+
                    user.getUserName()+" "+ user.getDob()+" "+user.getDp());
        }
    }

}
