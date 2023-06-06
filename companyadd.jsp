<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANY</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navbar .username {
            display: flex;
            align-items: center;
        }

        .navbar .username .circle-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #fff;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 10px;
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

        .message {
            background-color: #e1f7d9;
            padding: 5px;
            border-radius: 3px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="username">
            <div class="circle-icon">
                <%= request.getParameter("username").charAt(0) %>
            </div>
            <%= request.getParameter("username") %>
        </div>
    </div>
    <br><br>
    <div class="container">
        <h2>username: <%= request.getParameter("companyName") %></h2>
        <%
        Connection con = null;
        Statement st = null;
        String username = request.getParameter("username");
        String companyName = request.getParameter("companyName");
        String status = "PENDING";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
            st = con.createStatement();
            String str = "insert into choosencompany values('" + username + "','" + companyName + "','" + status + "')";
            st.executeUpdate(str);
            %>
            <div class="message">
                <p>Selection done</p>
            </div>
            <%
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </div>
</body>
</html>
