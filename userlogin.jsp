<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN PAGE</title>
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
    <center>
        <h1>USER LOGIN</h1>
        <form action="userprofile.jsp" method="POST">
            <label>User Name</label>
            <input type="text" name="myid" id="myid" required><br><br>
            <label>Password</label>
            <input type="password" name="pass" id="pass" required><br><br>
            <input type="submit" name="submit" value="Login"><br><br>
            <a href="resetpass.jsp">Forgot Password</a>
        </form>
    </center>
</body>
</html>
