<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String status = request.getParameter("status");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "");
    PreparedStatement ps = con.prepareStatement("UPDATE leave_applications SET status=? WHERE id=?");
    ps.setString(1, status);
    ps.setInt(2, Integer.parseInt(id));
    ps.executeUpdate();
    con.close();
    response.sendRedirect("viewLeaves.jsp");
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
