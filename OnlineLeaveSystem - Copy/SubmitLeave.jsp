<%@ page import="java.sql.*" %>
<%
    String employee_name = request.getParameter("employee_name");
    String leave_type = request.getParameter("leave_type");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    String reason = request.getParameter("reason");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO leave_applications(employee_name, leave_type, start_date, end_date, reason, status) VALUES (?, ?, ?, ?, ?, 'Pending')"
        );

        ps.setString(1, employee_name);
        ps.setString(2, leave_type);
        ps.setString(3, start_date);
        ps.setString(4, end_date);
        ps.setString(5, reason);

        ps.executeUpdate();
        con.close();

        out.println("<script>alert('Leave Application Submitted Successfully!'); window.location='home_employee.jsp';</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
