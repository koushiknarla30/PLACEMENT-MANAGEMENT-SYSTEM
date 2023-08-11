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

        .skill {
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
        <h1>SKILLS</h1>
        <div class="skill">
            <p>Skill: <%= request.getParameter("skill1") %></p>
            <p>Skill: <%= request.getParameter("skill2") %></p>
            <p>Skill: <%= request.getParameter("skill3") %></p>
            <p>Skill: <%= request.getParameter("skill4") %></p>
        </div>
        <center>
            <%
    String skill1 = request.getParameter("skill1");
    String skill2 = request.getParameter("skill2");
    String skill3 = request.getParameter("skill3");
    String skill4 = request.getParameter("skill4");
    String username = request.getParameter("username");
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        String selectQuery = "SELECT * FROM skills WHERE sid='" + username + "'";
        rs = st.executeQuery(selectQuery);
        if (rs.next()) {
            String updateQuery = "UPDATE skills SET skill1='" + skill1 + "', skill2='" + skill2 + "', skill3='" + skill3 + "', skill4='" + skill4 + "' WHERE sid='" + username + "'";
            st.executeUpdate(updateQuery);
        } else {
            String insertQuery = "INSERT INTO skills VALUES('" + username + "', '" + skill1 + "', '" + skill2 + "', '" + skill3 + "', '" + skill4 + "')";
            st.executeUpdate(insertQuery);
        }
        %>
        <p class="success-message">Skills updated successfully.</p>
        <%
    } catch (Exception e) {
        out.println(e);
    } 
    %>
        </center>
    </div>
</body>
</html>