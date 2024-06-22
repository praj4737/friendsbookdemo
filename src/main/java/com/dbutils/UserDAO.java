package com.dbutils;

import com.beans.User;
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
                count=rd.getInt(1);
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
}
