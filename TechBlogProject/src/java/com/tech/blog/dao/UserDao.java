package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //Method to insert data
    public boolean saveUser(User user) {

        boolean flag = false;

        try {

            //User --> Database
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());

            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

//    Get user by useremail and userpassword
    public User getUserByEmailAndPassword(String email, String password) {

        User user = null;

        try {

            String query = "Select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet set = ps.executeQuery();

            //This checks the row
            if (set.next()) {
                user = new User();

                //Data from object
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    //Update user
    public boolean updateUser(User user) {

        boolean flag = false;

        try {

            String query = "update user set name=?, email=?, password=?, Gender=?, about=?, profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());

            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

    public User getUserByUserId(int userId) {
        User user = null;

        try {
            
            String q = "select * from user where id=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                user = new User();

                //Data from object
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            } else {
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
