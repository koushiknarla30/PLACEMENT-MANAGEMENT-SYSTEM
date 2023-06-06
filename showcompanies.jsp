<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANIES</title>
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
    </style>
</head>
<body>
    <center>
        <h2>COMPANIES</h2>
    <%
    Connection con = null;
    Statement st = null;
    ResultSet rs=null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        String str="SELECT * FROM companies";
        rs=st.executeQuery(str);
        out.println("<table>");
            out.println("<tr><th>COMPANY NAME</th><th>JOB TITLE</th><th>SKILLS</th><th>PREFERENCE CRITERIA</th><th>PACKAGE</th></tr>");
        while(rs.next()){
            out.println("<tr><td>" + rs.getString("company_name") + "</td><td>" + rs.getString("job_title") + "</td><td>" + rs.getString("skills") + "</td><td>"+ rs.getString("preference_criteria") +"</td><td>"+ rs.getString("package")+"</td></tr>");
        }
        out.println("</table>");

} 
catch (Exception e) {
    out.println(e);
}
    %>
</center>
</body>
</html>