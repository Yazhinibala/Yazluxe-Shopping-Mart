<%@ page import="commerce.jdbc_conn.dbcon" %>
<%@ page import="commerce.model.*" %>
<%@ page import="commerce.dao.productdao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    user auth = (user) session.getAttribute("auth");
    ArrayList<cart> cartSessionList = (ArrayList<cart>) session.getAttribute("cart-list");
    List<cart> cartProducts = new ArrayList<>();
    double total = 0;
    if (cartSessionList != null && !cartSessionList.isEmpty()) {
        try {
            productdao pdao = new productdao(dbcon.getConnection());
            cartProducts = pdao.getCartProducts(cartSessionList);
            total = pdao.getTotalCartPrice(cartSessionList);
        } catch (Exception e) { e.printStackTrace(); }
    }
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Cart - YazLuxe</title>
  <%@ include file="includes/head.jsp" %>
</head>
<body>
  <%@ include file="includes/navbar.jsp" %>

  <div class="container my-4">
    <h4 class="section-heading"><i class="fas fa-cart-shopping me-2"></i>Your Shopping Cart</h4>

    <% if ("exists".equals(msg)) { %>
    <div class="alert alert-warning alert-dismissible fade show rounded-3">
      <i class="fas fa-info-circle me-1"></i>This item is already in your cart.
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>

    <% if (cartProducts.isEmpty()) { %>
    <div class="text-center py-5 bg-white rounded-3 shadow-sm">
      <i class="fas fa-cart-shopping fa-4x mb-3" style="color:#e94560"></i>
      <h5 class="fw-bold" style="color:#1a1a2e">Your cart is empty!</h5>
      <p class="text-muted">Add some products to get started</p>
      <a href="index.jsp" class="btn btn-buy px-4 py-2 mt-2">
        <i class="fas fa-arrow-left me-1"></i>Continue Shopping
      </a>
    </div>
    <% } else { %>

    <!-- Total Bar -->
    <div class="d-flex justify-content-between align-items-center p-4 rounded-3 mb-3 shadow-sm"
         style="background: linear-gradient(90deg,#1a1a2e,#0f3460); color:white;">
      <div>
        <span class="fs-6">Total Amount:</span>
        <span class="fs-4 fw-bold ms-2" style="color:#f5a623">&#8377; <%= dcf.format(total) %></span>
      </div>
      <a href="check-out" class="btn px-4 py-2 fw-bold"
         style="background:linear-gradient(90deg,#e94560,#f5a623);color:white;border-radius:10px;">
        <i class="fas fa-credit-card me-2"></i>Checkout All
      </a>
    </div>

    <div class="table-responsive rounded-3 shadow-sm overflow-hidden">
      <table class="table table-hover mb-0 custom-table">
        <thead>
          <tr>
            <th class="py-3 ps-4">Product</th>
            <th class="py-3">Category</th>
            <th class="py-3">Price</th>
            <th class="py-3">Quantity</th>
            <th class="py-3">Buy Now</th>
            <th class="py-3">Remove</th>
          </tr>
        </thead>
        <tbody style="background:white;">
          <% for (cart c : cartProducts) { %>
          <tr>
            <td class="fw-semibold align-middle ps-4" style="color:#1a1a2e"><%= c.getName() %></td>
            <td class="align-middle"><span class="category-badge"><%= c.getCategory() %></span></td>
            <td class="align-middle fw-bold" style="color:#e94560">&#8377; <%= dcf.format(c.getPrice()) %></td>
            <td class="align-middle">
              <div class="d-flex align-items-center gap-2">
                <a href="quantity-inc-dec?action=dec&id=<%= c.getId() %>"
                   class="btn btn-sm fw-bold"
                   style="background:#1a1a2e;color:white;border-radius:8px;width:32px;">−</a>
                <span class="fw-bold px-2 fs-5"><%= c.getQuantity() %></span>
                <a href="quantity-inc-dec?action=inc&id=<%= c.getId() %>"
                   class="btn btn-sm fw-bold"
                   style="background:#e94560;color:white;border-radius:8px;width:32px;">+</a>
              </div>
            </td>
            <td class="align-middle">
              <form action="order-now" method="post" class="d-inline">
                <input type="hidden" name="id" value="<%= c.getId() %>">
                <input type="hidden" name="quantity" value="<%= c.getQuantity() %>">
                <button type="submit" class="btn btn-buy btn-sm px-3">
                  <i class="fas fa-bolt me-1"></i>Buy
                </button>
              </form>
            </td>
            <td class="align-middle">
              <a href="remove-from-cart?id=<%= c.getId() %>"
                 class="btn btn-sm px-3"
                 style="background:#dc3545;color:white;border-radius:8px;">
                <i class="fas fa-trash me-1"></i>Remove
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
