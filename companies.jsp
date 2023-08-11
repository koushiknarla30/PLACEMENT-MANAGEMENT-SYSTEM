<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPANIES</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        .companies {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        .company {
            margin: 10px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            border-radius: 5px;
        }

        button:hover {
            background-color: #3e8e41;
        }

        p {
            margin: 10px 0;
            line-height: 1;
        }
        .button-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }
        .button-container button {
            display: block;
        }
    </style>
</head>
<body>
    <center>
        <div class="companies">
            <% 
                Connection con = null;
                PreparedStatement pstm = null;
                String username =  request.getParameter("username");
                session.setAttribute("username", username);
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");
                    pstm = con.prepareStatement("SELECT * FROM companies");
                    ResultSet rs = pstm.executeQuery();
                    while (rs.next()) {
                        out.println("<div class='company'>");
                        out.println("<h3><b>COMPNAY NAME: </b>"+ rs.getString("company_name") + "</h3>");
                        out.println("<h4><b>TITLE: </b>" + rs.getString("job_title") + "</h4>");
                        out.println("<br>");
                        out.println("<p><b>SKILLS: </b>" + rs.getString("skills") + "</p>");
                        out.println("<br>");
                        out.println("<p><b>PREFERENCE CRITERIA: </b>" + rs.getString("preference_criteria") + "</p>");
                        out.println("<br>");
                        out.println("<p><b>PACKAGE: </b>" + rs.getString("package") + "</p>");
                        String companyName = rs.getString("company_name");
                        session.setAttribute("companyName", companyName);
                        out.println("<button onclick=\"location.href='companyadd.jsp?username=" + username + "&companyName=" + companyName + "'\">SELECT</button>");
                        out.println("</div>");
                    }
                } catch (Exception e) {
                    out.println(e);
                } 
            %>
        </div>
    </center>
</body>
</html>

</html>