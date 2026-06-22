<%@ page import="commerce.model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    user auth = (user) session.getAttribute("auth");
    if (auth != null) { response.sendRedirect("index.jsp"); return; }
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login - YazLuxe</title>
  <%@ include file="includes/head.jsp" %>
  <style>
    .login-wrapper {
      min-height: 85vh;
      display: flex;
      align-items: center;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
    }
    .login-card {
      border: none;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 20px 60px rgba(0,0,0,0.4);
    }
    .login-header {
      background: linear-gradient(135deg, #e94560, #f5a623);
      padding: 30px;
      text-align: center;
      color: white;
    }
    .form-control {
      border-radius: 10px;
      padding: 12px 15px;
      border: 2px solid #eee;
      transition: border-color 0.2s;
    }
    .form-control:focus { border-color: #e94560; box-shadow: none; }
    .btn-login {
      background: linear-gradient(90deg, #e94560, #f5a623);
      color: white;
      border: none;
      border-radius: 10px;
      padding: 12px;
      font-weight: 600;
      font-size: 1rem;
      transition: opacity 0.2s;
    }
    .btn-login:hover { opacity: 0.9; color: white; }
  </style>
</head>
<body>
  <%@ include file="includes/navbar.jsp" %>
  <div class="login-wrapper">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
          <div class="card login-card">
            <div class="login-header">
              <i class="fas fa-shopping-bag fa-2x mb-2"></i>
              <h4 class="mb-0 fw-bold">Welcome Back!</h4>
              <small>Login to YazLuxe Shopping Mart</small>
            </div>
            <div class="card-body p-4">
              <% if (error != null) { %>
              <div class="alert alert-danger rounded-3">
                <i class="fas fa-exclamation-circle me-1"></i><%= error %>
              </div>
              <% } %>
              <form action="user-login" method="post">
                <div class="mb-3">
                  <label class="form-label fw-semibold" style="color:#1a1a2e">
                    <i class="fas fa-envelope me-1" style="color:#e94560"></i>Email Address
                  </label>
                  <input type="email" class="form-control" name="login-email"
                         placeholder="Enter your email" required autofocus>
                </div>
                <div class="mb-4">
                  <label class="form-label fw-semibold" style="color:#1a1a2e">
                    <i class="fas fa-lock me-1" style="color:#e94560"></i>Password
                  </label>
                  <input type="password" class="form-control" name="login-password"
                         placeholder="Enter your password" required>
                </div>
                <div class="d-grid">
                  <button type="submit" class="btn btn-login">
                    <i class="fas fa-sign-in-alt me-2"></i>Login Now
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="includes/footer.jsp" %>
</body>
</html>
