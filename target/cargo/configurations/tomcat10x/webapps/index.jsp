<%@ page import="commerce.jdbc_conn.dbcon" %>
<%@ page import="commerce.model.*" %>
<%@ page import="commerce.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    user auth = (user) session.getAttribute("auth");
    List<product> products = new ArrayList<>();
    try {
        productdao pd = new productdao(dbcon.getConnection());
        products = pd.getAllProducts();
    } catch (Exception e) {
        e.printStackTrace();
    }
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>YazLuxe Shopping Mart</title>
  <%@ include file="includes/head.jsp" %>
</head>
<body>
  <%@ include file="includes/navbar.jsp" %>

  <div class="container my-4">

    <% if ("order_failed".equals(error)) { %>
    <div class="alert alert-danger alert-dismissible fade show">
      Order failed. Please try again.
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>

    <!-- Hero Banner -->
    <div class="hero-banner text-white text-center mb-4">
      <h1 class="display-5 fw-bold"><i class="fas fa-shopping-bag me-2"></i>YazLuxe Shopping Mart</h1>
      <p class="lead mb-3">Discover the latest trends in fashion &amp; lifestyle</p>
      <span class="badge px-4 py-2 fs-6" style="background:rgba(255,255,255,0.2); border-radius:30px;">
        🛍️ <%= products.size() %> Products Available
      </span>
    </div>

    <!-- Products Section -->
    <h4 class="section-heading"><i class="fas fa-th-large me-2"></i>All Products</h4>

    <div class="row g-4">
    <%
      if (products.isEmpty()) {
    %>
      <div class="col-12">
        <div class="alert alert-info text-center py-4">
          <i class="fas fa-box-open fa-2x d-block mb-2"></i>
          No products found. Add products to your database.
        </div>
      </div>
    <%
      } else {
        for (product p : products) {
            // URL-encode image filename to handle spaces
            String imgName = p.getImage() != null ? p.getImage().replace(" ", "%20") : "";
    %>
      <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="card product-card h-100">
          <div class="img-wrapper">
            <img src="product-images/<%= imgName %>"
                 class="card-img-top"
                 alt="<%= p.getName() %>"
                 onerror="this.parentElement.innerHTML='<div style=\'height:220px;background:linear-gradient(135deg,#667eea,#764ba2);display:flex;align-items:center;justify-content:center;\'><div style=\'text-align:center;color:white;\'><i class=\'fas fa-image fa-3x mb-2\'></i><br><small><%= p.getName().replace("'","") %></small></div></div>'">
          </div>
          <div class="card-body d-flex flex-column p-3">
            <h6 class="card-title fw-bold mb-1" style="color:#1a1a2e; font-size:0.9rem;"><%= p.getName() %></h6>
            <p class="price mb-1">&#8377; <%= String.format("%.2f", p.getPrice()) %></p>
            <p class="mb-3"><span class="category-badge"><i class="fas fa-tag me-1"></i><%= p.getCategory() %></span></p>
            <div class="mt-auto d-flex gap-2">
              <a href="add_to_cart?id=<%= p.getId() %>" class="btn btn-cart flex-fill">
                <i class="fas fa-cart-plus me-1"></i>Add to Cart
              </a>
              <a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-buy flex-fill">
                <i class="fas fa-bolt me-1"></i>Buy Now
              </a>
            </div>
          </div>
        </div>
      </div>
    <%
        }
      }
    %>
    </div>
  </div>

  <%@ include file="includes/footer.jsp" %>
</body>
</html>
