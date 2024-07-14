package com.dbutils;

import com.beans.User;
import com.beans.UserPost;
import com.constants.AppContants;
import com.constants.CommonErros;
import com.response.beans.UserRegistrationResponse;

import java.sql.*;
import java.time.LocalDate;

public class UserDAO {
    public static boolean isEmailExistInDB(String email){
        Connection con=DBUtils.getDbConnection();
        Statement st=null;
        ResultSet rd=null;
        boolean result=false;
        try {
            st=con.createStatement();
            rd=st.executeQuery("select * from users where email='"+email+"';");
            if(rd!=null && rd.next()){
                result=true;
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
        return result;
    }
    public static void registerUser(String query, UserRegistrationResponse response){
        Connection con=DBUtils.getDbConnection();
        Statement st=null;
        try {
            st=con.createStatement();
            int rowAffected=st.executeUpdate(query);
            if(rowAffected>0){
                response.setStatus("OK");
                response.setMessage("Data Saved Successfully");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static  int getCorrespondigId(String tableName) {
        Connection con=DBUtils.getDbConnection();
        int count=-1;
        if(con!=null) {
            Statement st=null;
            ResultSet rd=null;
            try {
                st = (Statement) con.createStatement();
                rd=st.executeQuery("select count(*) from "+tableName);
                rd.next();
                count=rd.getInt(1)+1;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }finally {
                try {
                    st.close();
                    rd.close();
                    con.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }


        }
        return count;
    }

    public static void registerUsersss(User user, UserRegistrationResponse response){
        Connection con=DBUtils.getDbConnection();
        try {
            // here we are setting the autocommit to false as the changes should not be automatically committed.
            con.setAutoCommit(false);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        PreparedStatement pst=null;
        PreparedStatement pst2=null;
        String query1="insert into users values("+user.getUserId()+",'"+user.getEmail()+"','"+user.getUserName()+"','"+user.getGender()+"','"+user.getDob()+"');";
        String query2="insert into creds values("+(UserDAO.getCorrespondigId("creds")+1)+","+user.getUserId()+",'"+user.getPassword()+"','"+ LocalDate.now()+"',null);";
        try {
            pst=con.prepareStatement(query1);
            pst2=con.prepareStatement(query2);
            pst.executeUpdate();
            pst2.executeUpdate();
            con.commit();
            response.updateResponse(null,AppContants.SUCCESS_CODE,AppContants.USER_REGISTERED);
            response.setUserId(user.getUserId());
        } catch (SQLException e) {
            try {
                con.rollback();
                response.updateResponse(CommonErros.UNABLE_TO_REGISTER_USER,CommonErros.BAD_REQUEST,null);
            } catch (SQLException ex) {

            }

        }finally {
            try {
                pst.close();
                pst2.close();
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static String[] generateQuery(User user){
        String[] query=new String[2];
        user.setUserId(UserDAO.getCorrespondigId("users")+1);
        query[0]="insert into users values("+user.getUserId()+",'"+user.getEmail()+"','"+user.getUserName()+"','"+user.getGender()+"','"+user.getDob()+"');";
        query[1]="insert into creds values("+(UserDAO.getCorrespondigId("creds")+1)+","+user.getUserId()+",'"+user.getPassword()+"','"+ LocalDate.now()+"',null);";
        return query;
    }
    public static boolean dpUploaddao(User user) {
        Connection con=DBUtils.getDbConnection();
        Statement st=null;
        ResultSet rd=null;
        boolean result=false;
        String QUERY = "insert into dp_table values("+getCorrespondigId("dp_table")+","+user.getUserId()+",'"+user.getDp()+"','"+LocalDate.now()+"', null);";
        try {
            st = con.createStatement();
            int row =  st.executeUpdate(QUERY);
            if(row>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public static boolean LoginDao(String email, String password){

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        if(isEmailExistInDB(email)){
            int userId = getUserId(email);
            if(userId!=-1){
                con=DBUtils.getDbConnection();
                String QUERY  = "select password from creds where userId="+userId+";";
                try {
                    st = con.createStatement();
                    rs = st.executeQuery(QUERY);
                    if(rs.next()){
                        //return true;
                        if(rs.getString(1).equals(password)){
                            return true;
                        }else{
                            return false;
                        }
                    }else{
                        return false;
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }else{
                return false;
            }
        }else{
            return false;
        }


    }
    public static int getUserId(String email){
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String QUERY = "select userId from users where email='"+email+"';";

        con = DBUtils.getDbConnection();
        try {
            st = con.createStatement();
            rs = st.executeQuery(QUERY);
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
    public static User getUser(String email){
        User user = new User();
        user.setUserId(getUserId(email));

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String QUERY = "select * from users where userId = "+user.getUserId()+";";
        con = DBUtils.getDbConnection();
        try {
            st = con.createStatement();
            rs = st.executeQuery(QUERY);
            if(rs.next()){
                user.setUserId(rs.getInt(1));
                user.setEmail(rs.getString(2));
                user.setUserName(rs.getString(3));
                user.setGender(rs.getString(4));
                user.setDob(rs.getDate(5).toLocalDate());

                return user;

            }
        }catch(SQLException se){se.printStackTrace();}

        return null;
    }
    public static int postCount(){
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String QUERY = "select count(*) from user_post;";
        con = DBUtils.getDbConnection();
        try {
            st = con.createStatement();
            rs = st.executeQuery(QUERY);
            if(rs.next()){
                return (rs.getInt(1)+1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return -1;
    }
    public static boolean makePost(User user){
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean result=false;
        String QUERY = "insert into user_post values('"+"post"+postCount()+"',"+user.getUserId()+",'"+user.getUserPost().getCaption()+"','"+user.getUserPost().getImage()+"','"+user.getUserPost().getLikes()+"','"+user.getUserPost().getComments()+"','"+user.getUserPost().getShares()+"','"+user.getUserPost().getDateOfPost()+"',null);";
        con = DBUtils.getDbConnection();
        try {
            st = con.prepareStatement(QUERY);
            int row =  st.executeUpdate();
            if(row>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public static ResultSet fetchPost(){
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        UserPost post = new UserPost();
        String QUERY = "select * from user_post";
        con = DBUtils.getDbConnection();
        try {
            st = con.prepareStatement(QUERY,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = st.executeQuery();
            if(rs.next()){
                return rs;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;

    }
    public static User getUser(int userId){
        User usr = new User();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        UserPost post = new UserPost();
        String QUERY = "select * from users where userId="+userId+";";
        con = DBUtils.getDbConnection();
        try {
            st = con.createStatement();
            rs = st.executeQuery(QUERY);
            if(rs.next()){
                usr.setUserId(rs.getInt(1));
               usr.setUserName(rs.getString(3));
               usr.setEmail(rs.getString(2));
               usr.setGender(rs.getString(4));
               usr.setDob(rs.getDate(5).toLocalDate());
               return usr;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;

    }
    public static ResultSet fetchFriends(){
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String QUERY = "select * from users";
        con = DBUtils.getDbConnection();
        try{
            st = con.prepareStatement(QUERY,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = st.executeQuery();
            if(rs.next()){
                return rs;
            }
        }catch(SQLException se){
            se.printStackTrace();
        }
        return null;
    }
    public static String getUserDp(int userId){
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        con = DBUtils.getDbConnection();

        try{
            st = con.createStatement();
            rs = st.executeQuery("select imageUrl from dp_table where userId="+userId+";");
            if(rs.next()){
                return rs.getString(1);
            }
        }catch(SQLException se){
            se.printStackTrace();
        }
        return null;
    }
}
