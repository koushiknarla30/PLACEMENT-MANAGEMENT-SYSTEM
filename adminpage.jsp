<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN PAGE</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        p {
            font-size: 20px;
            margin-bottom: 10px;
        }

        button {
            display: block;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button + button {
            margin-top: 20px;
        }

        button:hover {
            background-color: #555;
            transform: (2,2);
        }
    </style>
</head>
<body>
    <div>
        <p>VIEW THE STUDENT DETAILS</p>
        <button onclick="location.href='details.jsp'">STUDENT DETAILS</button>
        <p>CHECK STUDENT REQUEST FOR COMPANIES</p>
        <button onclick="location.href='check.jsp'">CHECK REQUESTS</button>
        <p>SHOW COMPANIES</p>
        <button onclick="location.href='showcompanies.jsp'">SHOW COMPANIES</button>
        <p>ADD COMPANIES</p>
        <button onclick="location.href='addcompany.jsp'">ADD COMPANY</button>

    </div>
</body>
</html>
