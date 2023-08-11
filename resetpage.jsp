<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PASSWORD RESET PAGE</title>
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
    <h2>UPDATE PASSWORD</h2>
    <%
    String name=request.getParameter("username");
    String phns=request.getParameter("phn");

    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
        st = con.createStatement();
        String str="SELECT * from resetpass WHERE id='" +name+ "' AND fphn='" +phns+ "' ";
        rs=st.executeQuery(str);
        if(rs.next()){
            out.println("<form action=\"updatepass.jsp\" method=\"post\" >");
            out.println("Username: <input type=\"text\" name=\"usr\" id=\"usr\" required><br><br>");
            out.println("New Password: <input type=\"password\" name=\"pas\" id=\"pas\" required><br><br>");
            out.println("Re-enter Password: <input type=\"password\" name=\"repas\" id=\"repas\" required><br><br>");
            out.println("<input type=\"submit\" value=\"Submit\">");
            out.println("</form>");

        }
        else {
            out.println("<p>invalid Password or Phone Number</p>");
            out.println("<button onclick=\"location.href='resetpass.jsp'\">BACK</button>");
        }
        
            
    }
    catch(Exception e){
        out.println(e);
    }
    %>
</center>
</body>
</html>