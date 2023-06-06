<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>successful</title>

</head>
<body>
    <center>
        <% 
            String name = request.getParameter("myname");
            String password = request.getParameter("pass");
            String rpassword= request.getParameter("repass");
            
            
            if (rpassword.equals(password)) {
                Connection con = null;
                Statement st = null;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
                    st = con.createStatement();
                    String str= "INSERT INTO userlogindata VALUES('"+name+"','"+password+"')";
                    st.executeUpdate(str);
                    out.println("<p>SignUp successful!</p>");
                    

                }catch(Exception e)
                {
                   out.println(e);
                }  
            } else {
                out.println("<p>Check password</p>");
            }
        %>
       <br>
        <button onclick="location.href='userlogin.jsp'">User Login</button>

    </center>
</body>
</html>
