<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("employee_name");
String type = request.getParameter("leave_type");
String start = request.getParameter("start_date");
String end = request.getParameter("end_date");
String reason = request.getParameter("reason");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/leave_system", "root", "");

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO leave_applications (employee_name, leave_type, start_date, end_date, reason) VALUES (?,?,?,?,?)");

    ps.setString(1, name);
    ps.setString(2, type);
    ps.setString(3, start);
    ps.setString(4, end);
    ps.setString(5, reason);

    int i = ps.executeUpdate();
    if (i > 0) {
        out.println("<h3 style='color:green'>Leave Application Submitted Successfully!</h3>");
    } else {
        out.println("<h3 style='color:red'>Error submitting leave!</h3>");
    }
    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
