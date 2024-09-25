<%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:9595/extra", "root", "root");

        if ("Insert".equals(action)) {
            pst = conn.prepareStatement("INSERT INTO users (name, email) VALUES (?, ?)");
            pst.setString(1, name);
            pst.setString(2, email);
            int result = pst.executeUpdate();
            out.println(result + " record inserted.");

        } else if ("Update".equals(action)) {
            pst = conn.prepareStatement("UPDATE users SET name = ?, email = ? WHERE id = ?");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, id);
            int result = pst.executeUpdate();
            out.println(result + " record updated.");

        } else if ("Delete".equals(action)) {
            pst = conn.prepareStatement("DELETE FROM users WHERE id = ?");
            pst.setString(1, id);
            int result = pst.executeUpdate();
            out.println(result + " record deleted.");

        } else if ("Display".equals(action)) {
            pst = conn.prepareStatement("SELECT * FROM users");
            rs = pst.executeQuery();
            out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Email</th></tr>");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("email") + "</td></tr>");
            }
            out.println("</table>");

        } else if ("Search".equals(action)) {
            pst = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                out.println("Record found: ID=" + rs.getInt("id") + ", Name=" + rs.getString("name") + ", Email=" + rs.getString("email"));
            } else {
                out.println("No record found for ID=" + id);
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pst != null) pst.close();
        if (conn != null) conn.close();
    }
%>
