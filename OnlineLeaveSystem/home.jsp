<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <style>
    body {
      text-align: center;
      font-family: Arial;
      background: #f2f2f2;
      padding: 100px;
    }
    .btn {
      display: inline-block;
      margin: 10px;
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }
    .btn:hover { background-color: #0056b3; }
  </style>
</head>
<body>
  <h1>Welcome Admin, <%= session.getAttribute("adminUser") %>!</h1>
  <a href="viewLeaves.jsp" class="btn">View & Approve Leave Applications</a>
  <a href="logout.jsp" class="btn" style="background-color:#dc3545;">Logout</a>
</body>
</html>
