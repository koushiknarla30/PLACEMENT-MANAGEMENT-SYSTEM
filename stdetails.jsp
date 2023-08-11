<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT DETAILS</title>
    <style>
        .navbar {
            background-color: gray;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }
        
        .navbar .username {
            display: flex;
            align-items: center;
            margin-right: 20px;
        }
        
        .navbar .username .circle {
            width: 30px;
            height: 30px;
            background-color: #ccc;
            border-radius: 50%;
            margin-right: 10px;
        }

        table {
            width: 60%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        h1 {
            margin-bottom: 20px;
        }

        p {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <center>
    <div class="navbar">
        <div class="username">
            <div class="circle"></div>
            <%= request.getParameter("username") %>
        </div>
    </div>
    <br><br>
  
    <!-- <h1>USERNAME: <%= request.getParameter("username") %></h1>   -->
    <%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String username = request.getParameter("username");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        
        String str = "SELECT * FROM academicdata WHERE sid='" + username + "'";
        rs = st.executeQuery(str);
        if (rs.next()) {
            out.println("<table>");
            out.println("<tr><th>BRANCH</th><th>CGPA</th><th>No.of Blacklogs</th></tr>");
            out.println("<tr><td>" + rs.getString("sbranch") + "</td><td>" + rs.getString("cgpa") + "</td><td>" + rs.getString("blacklogs") + "</td></tr>");
            out.println("</table>");
        }
        else {
            out.println("<p>Academic data not found</p>");
        }
        out.println("<br><br>");

        String str1 = "SELECT * FROM skills WHERE sid='" + username + "'";
        rs = st.executeQuery(str1);
        if (rs.next()) {
            out.println("<table>");
            out.println("<tr><th>SKILL1</th><th>SKILL2</th><th>SKILL3</th><th>SKILL4</th></tr>");
            out.println("<tr><td>" + rs.getString("skill1") + "</td><td>" + rs.getString("skill2") + "</td><td>" + rs.getString("skill3") + "</td><td>" + rs.getString("skill4") + "</td></tr>");
            out.println("</table>");
        }
        else {
            out.println("<p>Skills data not found</p>");
        }
        
        String str2 = "SELECT * FROM extraactivities WHERE sid='" + username + "'";
        rs = st.executeQuery(str2);
        if (rs.next()) {
            out.println("<table>");
            out.println("<tr><th>EXTRA1</th><th>EXTRA2</th></tr>");
            out.println("<tr><td>" + rs.getString("extra1") + "</td><td>" + rs.getString("extra2") + "</td></tr>");
            out.println("</table>");
        }
        else {
            out.println("<p>Extra curricular activities not found</p>");
        }
    } catch (Exception e) {
        out.println(e);
    }
    %> 
</center>
</body>
</html>
