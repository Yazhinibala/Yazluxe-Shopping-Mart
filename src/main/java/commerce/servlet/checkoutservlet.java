package commerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import commerce.dao.orderdao;
import commerce.jdbc_conn.dbcon;
import commerce.model.*;

@WebServlet("/check-out")
public class checkoutservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String today = formatter.format(new Date());

            ArrayList<cart> cartList = (ArrayList<cart>) request.getSession().getAttribute("cart-list");
            user auth = (user) request.getSession().getAttribute("auth");

            if (auth == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (cartList == null || cartList.isEmpty()) {
                response.sendRedirect("cart.jsp");
                return;
            }

            orderdao oDao = new orderdao(dbcon.getConnection());
            for (cart c : cartList) {
                orders order = new orders();
                order.setId(c.getId());
                order.setUid(auth.getId());
                order.setQuantity(c.getQuantity());
                order.setDate(today);
                oDao.insertOrder(order);
            }
            cartList.clear();
            response.sendRedirect("orders.jsp");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
