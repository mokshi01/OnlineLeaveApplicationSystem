<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>View Leave Applications</title>
  <style>
    body {
      font-family: Arial;
      background: linear-gradient(to right, #e0c3fc, #8ec5fc);
      padding: 30px;
    }
    h2 {
      text-align: center;
      color: #333;
    }
    table {
      width: 90%;
      margin: 20px auto;
      border-collapse: collapse;
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    th, td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }
    th {
      background: #007bff;
      color: white;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    a.button {
      background: #007bff;
      color: white;
      padding: 6px 12px;
      border-radius: 5px;
      text-decoration: none;
    }
    a.button:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>
  <h2>Leave Applications</h2>

  <table>
    <tr>
      <th>ID</th>
      <th>Employee Name</th>
      <th>Leave Type</th>
      <th>Start Date</th>
      <th>End Date</th>
      <th>Reason</th>
      <th>Status</th>
      <th>Action</th>
    </tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM leave_applications");

    while (rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("employee_name") %></td>
      <td><%= rs.getString("leave_type") %></td>
      <td><%= rs.getString("start_date") %></td>
      <td><%= rs.getString("end_date") %></td>
      <td><%= rs.getString("reason") %></td>
      <td><%= rs.getString("status") %></td>
      <td>
        <% if (!rs.getString("status").equalsIgnoreCase("Approved")) { %>
          <a class="button" href="updateStatus.jsp?id=<%= rs.getInt("id") %>&status=Approved">Approve</a>
        <% } %>
        <% if (!rs.getString("status").equalsIgnoreCase("Rejected")) { %>
          <a class="button" href="updateStatus.jsp?id=<%= rs.getInt("id") %>&status=Rejected">Reject</a>
        <% } %>
      </td>
    </tr>
<%
    }
    con.close();
} catch (Exception e) {
    out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
}
%>

  </table>
</body>
</html>
