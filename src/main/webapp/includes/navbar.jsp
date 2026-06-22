<%@ page import="commerce.model.user" %>
<%@ page import="commerce.model.cart" %>
<%@ page import="java.util.ArrayList" %>
<%
    user authUser = (user) session.getAttribute("auth");
    ArrayList<commerce.model.cart> navCartList = (ArrayList<commerce.model.cart>) session.getAttribute("cart-list");
    int cartCount = (navCartList != null) ? navCartList.size() : 0;
%>
<nav class="navbar navbar-expand-lg shadow">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      <i class="fas fa-shopping-bag me-2"></i>YazLuxe Shopping Mart
    </a>
    <button class="navbar-toggler border-secondary" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-center gap-1">
        <li class="nav-item">
          <a class="nav-link px-3" href="index.jsp"><i class="fas fa-home me-1"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link px-3" href="cart.jsp">
            <i class="fas fa-cart-shopping me-1"></i>Cart
            <% if (cartCount > 0) { %>
              <span class="badge rounded-pill" style="background:#e94560"><%= cartCount %></span>
            <% } %>
          </a>
        </li>
        <% if (authUser != null) { %>
        <li class="nav-item">
          <a class="nav-link px-3" href="orders.jsp"><i class="fas fa-box me-1"></i>My Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-warning px-3" href="log-out">
            <i class="fas fa-sign-out-alt me-1"></i>Logout (<%= authUser.getName() %>)
          </a>
        </li>
        <% } else { %>
        <li class="nav-item">
          <a class="nav-link px-3" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>
