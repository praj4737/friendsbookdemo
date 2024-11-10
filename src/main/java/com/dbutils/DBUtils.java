package com.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    public static Connection getDbConnection() {
        String url="jdbc:mysql://localhost:3306/friendsbook_db2";
        String user="root";
        String password="Computer@123";
        Connection con=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }
}
