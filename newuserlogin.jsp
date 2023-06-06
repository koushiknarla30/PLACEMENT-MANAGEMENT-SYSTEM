<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEW USER</title>
</head>
<body>
    <center>
    <form action="newuserdata.jsp" method="POST">
        <h1>NEW USER</h1>
        User Name<input type="text" name ="myname" id="myname" required>
        <br>
        <br>
        Password<input type="password" name="pass" id="pass" required>
        <br>
        <br>
        Reenter Password<input type="password" name="repass" id="repass" required>
        <br>
        <br>
        <input type="submit" name="submit" value="submit"/>
    </form>
</center>
</body>
</html>