package commerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

import commerce.model.cart;

@WebServlet("/remove-from-cart")
public class removefromcartservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            ArrayList<cart> cartList = (ArrayList<cart>) request.getSession().getAttribute("cart-list");
            if (cartList != null) {
                cartList.removeIf(c -> c.getId() == id);
            }
        }
        response.sendRedirect("cart.jsp");
    }
}
