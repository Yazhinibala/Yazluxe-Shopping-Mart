<%@ page import="commerce.jdbc_conn.dbcon" %>
<%@ page import="commerce.dao.*" %>
<%@ page import="commerce.model.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    user auth = (user) session.getAttribute("auth");
    List<orders> orderList = new ArrayList<>();
    if (auth != null) {
        try { orderList = new orderdao(dbcon.getConnection()).userOrders(auth.getId()); }
        catch (Exception e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Orders - YazLuxe</title>
  <%@ include file="includes/head.jsp" %>
</head>
<body>
  <%@ include file="includes/navbar.jsp" %>

  <div class="container my-4">
    <h4 class="section-heading"><i class="fas fa-box me-2"></i>My Orders</h4>

    <% if (auth == null) { %>
    <div class="text-center py-5 bg-white rounded-3 shadow-sm">
      <i class="fas fa-lock fa-4x mb-3" style="color:#e94560"></i>
      <h5 class="fw-bold" style="color:#1a1a2e">Please login to view your orders</h5>
      <a href="login.jsp" class="btn btn-buy px-4 py-2 mt-2">
        <i class="fas fa-sign-in-alt me-1"></i>Login Now
      </a>
    </div>

    <% } else if (orderList.isEmpty()) { %>
    <div class="text-center py-5 bg-white rounded-3 shadow-sm">
      <i class="fas fa-box-open fa-4x mb-3" style="color:#667eea"></i>
      <h5 class="fw-bold" style="color:#1a1a2e">No orders yet!</h5>
      <p class="text-muted">Start shopping to place your first order</p>
      <a href="index.jsp" class="btn btn-buy px-4 py-2 mt-2">
        <i class="fas fa-shopping-bag me-1"></i>Shop Now
      </a>
    </div>

    <% } else { %>
    <div class="table-responsive rounded-3 shadow-sm overflow-hidden">
      <table class="table table-hover mb-0 custom-table">
        <thead>
          <tr>
            <th class="py-3 ps-4">Order ID</th>
            <th class="py-3">Date</th>
            <th class="py-3">Product</th>
            <th class="py-3">Category</th>
            <th class="py-3">Qty</th>
            <th class="py-3">Total Price</th>
            <th class="py-3">Action</th>
          </tr>
        </thead>
        <tbody style="background:white;">
          <% for (orders o : orderList) { %>
          <tr>
            <td class="align-middle ps-4 text-muted fw-semibold">#<%= o.getOrderId() %></td>
            <td class="align-middle">
              <span class="badge px-3 py-2" style="background:#e8f0fe;color:#3c4ef5;border-radius:8px;">
                <i class="fas fa-calendar me-1"></i><%= o.getDate() %>
              </span>
            </td>
            <td class="align-middle fw-semibold" style="color:#1a1a2e"><%= o.getName() %></td>
            <td class="align-middle"><span class="category-badge"><%= o.getCategory() %></span></td>
            <td class="align-middle fw-bold text-center"><%= o.getQuantity() %></td>
            <td class="align-middle fw-bold" style="color:#27ae60; font-size:1rem;">&#8377; <%= dcf.format(o.getPrice()) %></td>
            <td class="align-middle">
              <a href="cancel-order?id=<%= o.getOrderId() %>"
                 class="btn btn-sm px-3 py-1"
                 style="background:#dc3545;color:white;border-radius:8px;"
                 onclick="return confirm('Are you sure you want to cancel this order?')">
                <i class="fas fa-times me-1"></i>Cancel
              </a>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
    <% } %>
  </div>

  <%@ include file="includes/footer.jsp" %>
</body>
</html>
