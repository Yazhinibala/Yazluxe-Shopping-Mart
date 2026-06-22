package commerce.dao;

import java.sql.*;
import commerce.model.user;

public class userdao {
    private Connection con;

    public userdao(Connection connection) {
        this.con = connection;
    }

    public user userLogin(String email, String password) {
        user userObj = null;
        try {
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                userObj = new user();
                userObj.setId(rs.getInt("id"));
                userObj.setName(rs.getString("name"));
                userObj.setEmail(rs.getString("email"));
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userObj;
    }
}
