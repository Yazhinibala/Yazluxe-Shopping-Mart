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

@WebServlet("/order-now")
public class ordernowservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            user auth = (user) request.getSession().getAttribute("auth");
            if (auth == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String today = formatter.format(new Date());

            int productId       = Integer.parseInt(request.getParameter("id"));
            int productQuantity = Integer.parseInt(request.getParameter("quantity"));
            if (productQuantity <= 0) productQuantity = 1;

            orders orderModel = new orders();
            orderModel.setId(productId);
            orderModel.setUid(auth.getId());
            orderModel.setQuantity(productQuantity);
            orderModel.setDate(today);

            orderdao orderDao = new orderdao(dbcon.getConnection());
            boolean result = orderDao.insertOrder(orderModel);

            if (result) {
                // Remove from cart if present
                ArrayList<cart> cartList = (ArrayList<cart>) request.getSession().getAttribute("cart-list");
                if (cartList != null) {
                    final int pid = productId;
                    cartList.removeIf(c -> c.getId() == pid);
                }
                response.sendRedirect("orders.jsp");
            } else {
                response.sendRedirect("index.jsp?error=order_failed");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
