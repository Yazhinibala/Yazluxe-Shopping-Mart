package commerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

import commerce.model.cart;

@WebServlet("/quantity-inc-dec")
public class quantityincdecservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        ArrayList<cart> cartList = (ArrayList<cart>) request.getSession().getAttribute("cart-list");

        if (action != null && cartList != null) {
            for (cart c : cartList) {
                if (c.getId() == id) {
                    if ("inc".equals(action)) {
                        c.setQuantity(c.getQuantity() + 1);
                    } else if ("dec".equals(action) && c.getQuantity() > 1) {
                        c.setQuantity(c.getQuantity() - 1);
                    }
                    break;
                }
            }
        }
        response.sendRedirect("cart.jsp");
    }
}
