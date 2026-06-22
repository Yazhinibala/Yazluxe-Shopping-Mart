package commerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

import commerce.model.cart;

@WebServlet("/add_to_cart")
public class addtocartservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        ArrayList<cart> cartList = (ArrayList<cart>) session.getAttribute("cart-list");

        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        // Check if already in cart
        for (cart c : cartList) {
            if (c.getId() == id) {
                // Already in cart — redirect to cart page
                response.sendRedirect("cart.jsp?msg=exists");
                return;
            }
        }

        cart cm = new cart();
        cm.setId(id);
        cm.setQuantity(1);
        cartList.add(cm);
        session.setAttribute("cart-list", cartList);
        response.sendRedirect("index.jsp");
    }
}
