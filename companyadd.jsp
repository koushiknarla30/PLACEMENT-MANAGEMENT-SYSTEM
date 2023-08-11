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
            text-align: center;
        }

        .message {
            background-color: #e1f7d9;
            padding: 5px;
            border-radius: 3px;
            margin-top: 10px;
        }
        button {
            display: block;
            width: 20%;
            padding: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: #555;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    
        button:hover {
            background-color: #777;
        }
        p{
            text-align: center;
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
        <h2>Company Name: <%= request.getParameter("companyName") %></h2>
        <%
        Connection con = null;
        Statement st = null,st1=null;
        ResultSet rs=null;
        String username = request.getParameter("username");
        String companyName = request.getParameter("companyName");
        String status = "PENDING";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
            st = con.createStatement();
            st1 = con.createStatement();
            String str = "insert into choosencompany values('" + username + "','" + companyName + "','" + status + "')";
            String str1= "SELECT * FROM choosencompany WHERE sid='"+ username +"' AND companyname='" + companyName + "'";
            rs=st1.executeQuery(str1);
            if(rs.next()){
                out.println("<p>You already selected this company</p>");
                out.println("<p>Check your status of approval</p>");
                out.println("<button onclick=\"location.href='companies.jsp'\">BACK</button>");
            }
            else{
                st.executeUpdate(str);
                out.println("<div class=\"message\">");
                out.println("    <p>Selection done</p>");
                out.println("</div>");
            }
        %>
            <%
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </div>
</body>
</html>
