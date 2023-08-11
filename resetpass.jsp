<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PASSWORD RESET</title>
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
    </style>
</head>
<body>
    <center>
    <h2>ENTER DETAILS</h2>
   <form action="resetpage.jsp" method="post">
    Enter Username: <input type="text" name="username" id="username" required>
    <br><br>
    Enter Father's phone number: <input type="text" name="phn" id="phn" required>
    <br><br>
    <!-- <button onclick="loaction.href='resetpage.jsp'">Submit</button>  -->
    <!-- <button onclick="location.href='admin.jsp'">Admin Login</button> -->
    <input type="submit" value="Submit">
   </form>
</center>
</body>
</html>
