package com.dbutils;

import com.response.beans.UserRegistrationResponse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
}
