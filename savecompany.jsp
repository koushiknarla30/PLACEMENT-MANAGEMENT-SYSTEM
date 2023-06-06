<%@ page import="java.sql.*" %>
<%
    String companyName = request.getParameter("companyname");
    String jobTitle = request.getParameter("jobtitle");
    String skills = request.getParameter("skills");
    String preferenceCriteria = request.getParameter("preferencecriteria");
    String packageValue = request.getParameter("package");

    Connection con = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "koushiknarla30");

        String query = "INSERT INTO companies (company_name, job_title, skills, preference_criteria, package) VALUES (?, ?, ?, ?, ?)";
        stmt = con.prepareStatement(query);
        stmt.setString(1, companyName);
        stmt.setString(2, jobTitle);
        stmt.setString(3, skills);
        stmt.setString(4, preferenceCriteria);
        stmt.setString(5, packageValue);
        stmt.executeUpdate();
        out.println("SUCCESSFULLY UPADTED");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } 
%>
