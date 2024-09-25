<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP CRUD Operations</title>
</head>
<body>
    <h2>JSP CRUD Form</h2>

    <form method="post" action="action.jsp">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br><br>
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>

        <input type="submit" name="action" value="Insert" required>
        <input type="submit" name="action" value="Update" required>
        <input type="submit" name="action" value="Delete" required>
        <input type="submit" name="action" value="Display" required>
        <input type="submit" name="action" value="Search" required>
    </form>
</body>
</html>
