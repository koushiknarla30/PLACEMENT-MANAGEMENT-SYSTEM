<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PERMISSION</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 20px;
        }

        .updated-message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= request.getParameter("answer") %></h2>
        <h2><%= request.getParameter("username") %></h2>
        <%
        Connection con = null;
        Statement st = null;
        String ans = request.getParameter("answer");
        String username = request.getParameter("username");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
            st = con.createStatement();
            String str = "UPDATE choosencompany SET status='" + ans + "' WHERE sid='" + username + "'";
            st.executeUpdate(str);
            %>
            <p class="updated-message">Updated</p>
            <%
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </div>
</body>
</html>
