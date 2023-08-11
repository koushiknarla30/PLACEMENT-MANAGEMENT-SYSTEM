<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPARE SKILLS</title>
    <style>
        .top-bar {
            background-color: #f0f0f0;
            padding: 5px;
            display: flex;
            align-items: center;
        }

        .profile-icon {
            width: 30px;
            height: 30px;
            background-color: #ccc;
            border-radius: 30%;
            margin-right: 5px;
        }

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

        h2 {
            margin-bottom: 20px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <div class="profile-icon"></div>
        <h2><%= request.getParameter("username") %></h2>
    </div>
    <h2>COMPANY NAME: <%= request.getParameter("companyname") %></h2>
    <%
    Connection con = null;
    Statement st = null, st1 = null, st2 = null, st3 = null;
    ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null;
    String username = request.getParameter("username");
    String companyname = request.getParameter("companyname");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        st1 = con.createStatement();
        st2 = con.createStatement();
        st3 = con.createStatement();
        String str = "SELECT * FROM skills WHERE sid='" + username + "'";
        String str1 = "SELECT * FROM companies WHERE company_name='" + companyname + "'";
        String str2 = "SELECT * FROM extraactivities WHERE sid='" + username + "'";
        String str3 = "SELECT * FROM academicdata WHERE sid='" + username + "'";
        rs = st.executeQuery(str);
        rs1 = st1.executeQuery(str1);
        rs2 = st2.executeQuery(str2);
        rs3 = st3.executeQuery(str3);
        if (rs.next() && rs1.next() && rs2.next() && rs3.next()) {
            out.println("<h2> PACKAGE: "+rs1.getString("package")+"</h2>");
            out.println("<h2> JOB TITLE: "+rs1.getString("job_title")+"</h2>");
            session.setAttribute("Username", username);
            out.println("<table>");
            out.println("<tr><th>STUDENT SKILLS</th><th>COMPANY REQUIREMENT SKILLS</th></tr>");
            out.println("<tr><td>" + rs.getString("skill1") + ", " + rs.getString("skill2") + ", " + rs.getString("skill3") + ", " + rs.getString("skill4") + "</td><td>" + rs1.getString("skills") + "</td></tr>");
            out.println("</table>");
            out.println("<table>");
            out.println("<tr><th>STUDENT EXTRACURRICULAR ACTIVITIES</th><th> STUDENT CGPA</th><th>COMPANY CRITERIA</th></tr>");
            out.println("<tr><td>" + rs2.getString("extra1") + ", " + rs2.getString("extra2") + "</td><td>" + rs3.getString("cgpa") + "</td><td>" + rs1.getString("preference_criteria") + "</td></tr>");
            out.println("</table>");
            out.println("<center>");
            out.println("<th>GRANT PERMISSION<p>");
            out.println("<button onclick=\"location.href='compared.jsp?answer=APPROVED&username=" + username + "'\">YES</button><button onclick=\"location.href='compared.jsp?answer=NOT APPROVED&username=" + username + "'\">NO</button>");
            out.println("</center>");
        }
    } catch (Exception e) {
        out.println(e);
    }
    %>
</body>
</html>
