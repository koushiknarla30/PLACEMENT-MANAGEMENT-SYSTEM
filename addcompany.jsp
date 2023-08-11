<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Company</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
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
    </style>
</head>
<body>
    <form action="savecompany.jsp" method="POST">
        <center>
        <h2>ADD COMPANY</h2>
    </center>
        <label for="companyname">Company Name:</label>
        <input type="text" id="companyname" name="companyname" required><br><br>
        
        <label for="jobtitle">Job Title:</label>
        <input type="text" id="jobtitle" name="jobtitle" required><br><br>
        
        <label for="skills">Skills:</label>
        <input type="text" id="skills" name="skills" required><br><br>
        
        <label for="preferencecriteria">Preference Criteria:</label>
        <textarea id="preferencecriteria" name="preferencecriteria" rows="6" cols="35" required></textarea><br><br>
        
        <label for="package">Package:</label>
        <input type="text" id="package" name="package" required><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
