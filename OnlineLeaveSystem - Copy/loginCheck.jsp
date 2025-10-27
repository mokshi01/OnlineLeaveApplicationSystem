<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM admin_users WHERE username=? AND password=?");
    ps.setString(1, username);
    ps.setString(2, password);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        response.sendRedirect("approve_leave.jsp");
    } else {
        out.println("<script>alert('Invalid username or password'); window.location='admin_login.html';</script>");
    }
    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
