<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("employeeUser") == null) {
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Employee Dashboard</title>
  <style>
    body {
      text-align: center;
      font-family: Arial;
      background: #e3f2fd;
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
  <h1>Welcome <%= session.getAttribute("employeeUser") %>!</h1>
  <a href="leaveApplication.html" class="btn">Apply for Leave</a>
  <a href="logout.jsp" class="btn" style="background-color:#dc3545;">Logout</a>
</body>
</html>
