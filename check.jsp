<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHECK PAGE</title>
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
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            text-align: center;
            display: inline-block;
            font-size: 10px;
            margin: 4px 2px;
            border-radius: 5px;
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
        
        String str = "SELECT * FROM choosencompany";
        rs = st.executeQuery(str);
        out.println("<table>");
        out.println("<tr><th>username</th><th>company name</th><th>status</th><th>compare</th></tr>");
        while (rs.next()) {
            String username = rs.getString("sid");
            String companyName = rs.getString("companyname");
            session.setAttribute("companyName", companyName);
            session.setAttribute("Username", username);
            out.println("<tr><td>" + username + "</td><td>" + companyName + "</td><td>" + rs.getString("status") + "</td><td><button onclick=\"location.href='comapare.jsp?username=" + username + "&companyname=" + companyName + "'\">COMPARE</button></td></tr>");
        }
        out.println("</table>");
    } catch (Exception e) {
        out.println(e);
    }
    %>
</center>
</body>
</html>
