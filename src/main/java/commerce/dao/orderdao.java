package commerce.dao;

import java.sql.*;
import java.util.*;
import commerce.model.orders;
import commerce.model.product;

public class orderdao {
    private Connection con;

    public orderdao(Connection con) {
        this.con = con;
    }

    public boolean insertOrder(orders model) {
        try {
            String query = "INSERT INTO orders (p_id, u_id, o_quantity, o_date) VALUES(?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            pst.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<orders> userOrders(int id) {
        List<orders> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders WHERE u_id=? ORDER BY o_id DESC";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                orders order = new orders();
                productdao productDao = new productdao(this.con);
                int pId = rs.getInt("p_id");
                product prod = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                if (prod != null) {
                    order.setName(prod.getName());
                    order.setCategory(prod.getCategory());
                    order.setPrice(prod.getPrice() * rs.getInt("o_quantity"));
                    order.setImage(prod.getImage());
                }
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void cancelOrder(int id) {
        try {
            String query = "DELETE FROM orders WHERE o_id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
