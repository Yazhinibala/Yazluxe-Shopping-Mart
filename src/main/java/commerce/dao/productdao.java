package commerce.dao;

import java.sql.*;
import java.util.*;
import commerce.model.cart;
import commerce.model.product;

public class productdao {
    private Connection con;

    public productdao(Connection con) {
        this.con = con;
    }

    public List<product> getAllProducts() {
        List<product> products = new ArrayList<>();
        try {
            String query = "SELECT * FROM products";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                product row = new product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                products.add(row);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<cart> getCartProducts(ArrayList<cart> cartList) {
        List<cart> products = new ArrayList<>();
        try {
            for (cart item : cartList) {
                String query = "SELECT * FROM products WHERE id=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, item.getId());
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    cart row = new cart();
                    row.setId(rs.getInt("id"));
                    row.setName(rs.getString("name"));
                    row.setCategory(rs.getString("category"));
                    row.setPrice(rs.getDouble("price") * item.getQuantity());
                    row.setQuantity(item.getQuantity());
                    products.add(row);
                }
                rs.close();
                pst.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public product getSingleProduct(int id) {
        product row = null;
        try {
            String query = "SELECT * FROM products WHERE id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                row = new product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public double getTotalCartPrice(ArrayList<cart> cartList) {
        double sum = 0;
        try {
            for (cart item : cartList) {
                String query = "SELECT price FROM products WHERE id=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, item.getId());
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    sum += rs.getDouble("price") * item.getQuantity();
                }
                rs.close();
                pst.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
}
