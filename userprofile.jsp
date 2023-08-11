<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USER PROFILE</title>
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

        table {
            width: 50%;
            border-collapse: collapse;
            margin-bottom: 40px;
            border: 1px solid #ccc;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            /* margin-left: auto;
            margin-right: auto; */
            text-align: center;

        }

        form {
            margin-bottom: 40px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
        }

        form input[type="text"],
        form input[type="submit"] {
            margin-bottom: 10px;
        }

        form p {
            margin-bottom: 10px;
        }
        .submit-button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #555;
        }

        .submit-button:active {
            background-color: #222;
        }
        .highlight {
            width: 33%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            }

    </style>
</head>
<body>
    <div class="top-bar">
        <div class="username">
            <div class="username__icon"></div>
            <span><%= session.getAttribute("username") %></span>
        </div>
    </div>
    <div class="content">
        <h1>STUDENT PROFILE</h1>
        <%
        String username = request.getParameter("myid");
        String p=request.getParameter("pass");
        session.setAttribute("username", username);
        Connection con = null;
        Statement st = null,st1=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
            st = con.createStatement();
            st1 = con.createStatement();
            String query = "SELECT * FROM academicdata WHERE sid='" + username + "'";
            String str="SELECT * FROM userlogindata WHERE username='" + username + "' AND password='" +p+ "' ";
            ResultSet rs = st.executeQuery(query);
            ResultSet rs1 = st1.executeQuery(str);
            if(rs1.next()){
            if (rs.next()) {
                out.println("<h3>" + rs.getString("sname") + "</h3>");
                out.println("<table>");
                out.println("<tr><th>BRANCH</th><th>CGPA</th><th>No. of Blacklogs</th></tr>");
                out.println("<tr><td>" + rs.getString("sbranch") + "</td><td>" + rs.getString("cgpa") + "</td><td>" + rs.getString("blacklogs") + "</td></tr>");
                out.println("</table>");
            } 
        }else {
                response.sendRedirect("invalid.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        } 
        %>
        <form action="skill.jsp" method="get">
            <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
            <label>SKILLS-1</label>
            <input type="text" name="skill1" id="skill1">
            <label>SKILLS-2</label>
            <input type="text" name="skill2" id="skill2">
            <label>SKILLS-3</label>
            <input type="text" name="skill3" id="skill3">
            <label>SKILLS-4</label>
            <input type="text" name="skill4" id="skill4"><br><br>
            <input type="submit" value="ADD" class="submit-button">
            <p class="highlight">If you don't have 4 skills, just fill it as NA</p>
        </form>
        <form action="extra.jsp" method="get">
            <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
            <label>EXTRA CURRICULAR ACTIVITIES</label>
            <input type="text" name="extra1" id="extra1">
            <label>EXTRA CURRICULAR ACTIVITIES</label>
            <input type="text" name="extra2" id="extra2"><br><br>
            <input type="submit" value="ADD" class="submit-button">
            <p class="highlight">If you don't have 2 extra curricular activities, just fill it as NA</p>
        </form>
        <form action="companies.jsp" method="get">
            <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
            <h3>CHOOSE YOUR DREAM COMPANY</h3>
            <input type="submit" value="Choose your company" class="submit-button">
        </form>
        <form action="status.jsp" method="get">
            <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
            <h3>CHECK THE STATUS OF APPROVAL</h3>
            <input type="submit" value="Check" class="submit-button">
        </form>
    </div>
</body>
</html>
