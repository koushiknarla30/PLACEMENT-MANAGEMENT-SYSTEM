<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT DETAILS</title>
    <style>
        table {
            width: 60%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }

        th {
            background-color: #f0f0f0;
        }

        button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <center>
    <%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        String str = "SELECT * FROM userlogindata";
        rs = st.executeQuery(str);
        out.println("<table>");
        out.println("<tr><th>STUDENT ID</th><th>CHECK DETAILS</th></tr>");
        while (rs.next()) {
            String username = rs.getString("username");
            session.setAttribute("Username", username);
            out.println("<tr><td>" + username + "</td><td><button onclick=\"location.href='stdetails.jsp?username=" + username + "'\">show details</button></td></tr>");
        }
        out.println("</table>");
    } catch (Exception e) {
        out.println(e);
    }
    %>
</center>
</body>
</html>
