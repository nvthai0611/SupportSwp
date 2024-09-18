/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {
    public User getUserById(int userId) {
        
        String sql = "select * from Customers\n"
                + "where customerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String userName  = rs.getString("userName");
                String password = rs.getString("password");
                String status = rs.getString("status");
                String imgUrl = rs.getString("img_url");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String fullName = rs.getString("fullName");
                User user = new User(userId, userName, password, status, imgUrl, phone, email, address, fullName);
                return user;
            }
        } catch (SQLException e) {
            System.out.println("loi get object by Id: " + e);
        }
        return null;
    }
    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        User check = u.getUserById(1);
        System.out.println(check);
    }
}
