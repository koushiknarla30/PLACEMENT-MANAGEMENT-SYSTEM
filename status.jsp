<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STATUS</title>
    <style>
        table {
            width: 75%;
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
    <%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    String username=request.getParameter("username");
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st=con.createStatement();
        String str="SELECT * FROM choosencompany WHERE sid='"+username+"'";
        rs=st.executeQuery(str);
        out.println("<table>");
            out.println("<tr><th>SID</th><th>COMPANYNAME</th><th>status</th></tr>");
        while(rs.next()){
                out.println("<tr><td>" + rs.getString("sid") + "</td><td>" + rs.getString("companyname") + "</td><td>" + rs.getString("status") + "</td></tr>");
        }
        out.println("</table>");
    }
    catch(Exception e){
        out.println(e);
    }
    %>
</body>
</html>
