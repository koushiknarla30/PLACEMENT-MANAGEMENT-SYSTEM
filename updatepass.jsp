<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PASSWORD UPDATED</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    
        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
        }
    
        form {
            width: 300px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    
        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
            font-size: 16px;
        }
    
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
    
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    
        input[type="submit"]:hover {
            background-color: #555;
        }

        p {
            text-align: center;
            color: #ff0000;
            font-size: 16px;
            margin-bottom: 10px;
        }
    
        button {
            display: block;
            width: 100%;
            padding: 10px;
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
    </style>
    
</head>
<body>
    <center>
    <%
    String upas=request.getParameter("pas");
    String urpas=request.getParameter("repas");
    String us=request.getParameter("usr");
    Connection con=null;
    Statement st=null,st1=null;
    ResultSet rs=null;
    if(upas.equals(urpas)){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        st1 = con.createStatement();
        String str= "Select * from userlogindata WHERE username='" +us+ "' ";
        String str1= "UPDATE userlogindata set password ='"+upas+"' WHERE username='" +us+ "' ";
        rs=st.executeQuery(str);
        if(rs.next()){
            st1.executeUpdate(str1);
            out.println("DONE");
            out.println("<button onclick=\"location.href='userlogin.jsp'\">LOGIN</button>");
        }
        else {
            out.println("invalid");
        }
        
    }
    catch(Exception e){
        out.println(e);
    }
}
else{
    out.println("<p>Passwords are not matching</p><br><br>");
    out.println("<button onclick=\"location.href='resetpage.jsp'\">BACK</button>");
}

    %>
    
</center>
</body>
</html>