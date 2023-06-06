<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin page</title>
</head>
<body>
    <center>
    <%
    String str=request.getParameter("aid");
    String str1=request.getParameter("apass");
    try{
    if(str.equals("miniproject2") && str1.equals("Miniproject@2")){
        response.sendRedirect("adminpage.jsp");
    }
    else{
        out.println("<h3>Invalid Password Or Username</h3>");
    }
}
catch(Exception e){
    System.out.println(e);
}
    %>
</center>
</body>
</html>