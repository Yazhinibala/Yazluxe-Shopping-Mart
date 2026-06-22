package commerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

import commerce.dao.userdao;
import commerce.jdbc_conn.dbcon;
import commerce.model.user;

@WebServlet("/user-login")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email    = request.getParameter("login-email");
        String password = request.getParameter("login-password");
        try {
            userdao udao = new userdao(dbcon.getConnection());
            user userObj = udao.userLogin(email, password);
            if (userObj != null) {
                request.getSession().setAttribute("auth", userObj);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Invalid email or password. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
