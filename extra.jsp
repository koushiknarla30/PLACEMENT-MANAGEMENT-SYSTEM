<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .top-bar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            align-items: center;
        }

        .username {
            display: flex;
            align-items: center;
        }

        .username__icon {
            width: 30px;
            height: 30px;
            background-color: #ccc;
            border-radius: 50%;
            margin-right: 10px;
        }

        .content {
            padding: 20px;
            background-color: #fff;
            margin: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .extra-activities {
            margin-bottom: 10px;
        }

        p.success-message {
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <div class="username">
            <div class="username__icon"></div>
            <span><%= request.getParameter("username") %></span>
        </div>
    </div>
    <div class="content">
        <h1>USER EXTRA CURRICULAR ACTIVITIES</h1>
        <div class="extra-activities">
            <h4>Extra Curricular Activities: <%= request.getParameter("extra1") %></h4>
            <h4>Extra Curricular Activities: <%= request.getParameter("extra2") %></h4>
        </div>
        <%
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String username = request.getParameter("username");
        Connection con = null;
        Statement st = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
            st = con.createStatement();
            String str = "INSERT INTO extraactivities VALUES('" + username + "','" + extra1 + "','" + extra2 + "')";
            st.executeUpdate(str);
            %>
            <p class="success-message">Extra activities updated successfully.</p>
            <%
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </div>
</body>
</html>
