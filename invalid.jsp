<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INVALID PAGE</title>
    <style>
        #container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div id="container">
        You are not an Authorised User<br>
        Please enter an Authorised User Login Details
    </div>
    <script>
        const container = document.getElementById('container');
        const content = container.innerHTML;
        const decodedContent = content.replace(/<br>/g, '\n');
        alert(decodedContent);
        container.innerHTML = ''; 
    </script>
</body>
</html>
