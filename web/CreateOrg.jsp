<%-- 
    Document   : CreateOrg
    Created on : May 29, 2020, 4:27:49 PM
    Author     : JoshuaDC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <!--<link rel="stylesheet" href="assets/libs/css/style.css">-->
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>Create Organization - Organissembly</title>
    </head>
    <body>
        <div class="col-md-6">
                
        <form method="POST" action="Save" enctype="multipart/form-data" id="orgForm">
            <label for="orgName">Organization Name: </label>
            <input type="text" required="" name="orgName" id="orgName" class="form-control">
            <label for="orgDescription">Organization Description: </label>
            <input type="textbox" required="" name="orgDescription" id="orgDescription" class="form-control">
            <label for="orgVision">Organization's Vision: </label>
            <input type="textbox"  name="orgVision" id="orgVision" class="form-control">
            <label for="orgMission">Organization's Mission: </label>
            <input type="textbox"  name="orgMission" id="orgMission" class="form-control">
            <label for="orgImage">Organization's Profile Image</label>
            <input type="file" name="orgImage" id="orgImage" class="form-control" accept="image/x-png,image/jpeg">
            <hr>
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>Adviser</th>
                    <th>President</th>
                    <th>Vice President</th>
                    <th>Secretary</th>
                    <th>PRO</th>
                </tr>
                <%  ResultSet rs = (ResultSet)request.getAttribute("userRecords");
                while(rs.next()){ %>
                <tr>
                    <td><%= "" + rs.getString("user_lastName") + ", " + rs.getString("user_firstName") + " " + rs.getString("user_middleName") %></td>
                    <td><input type="radio" class="form-control" name="orgAdviser" value="<%= rs.getInt("user_id") %>"></td>
                    <td><input type="radio" class="form-control" name="orgPresident" value="<%= rs.getInt("user_id") %>"></td>
                    <td><input type="radio" class="form-control" name="orgVicePresident" value="<%= rs.getInt("user_id") %>"></td>
                    <td><input type="radio" class="form-control" name="orgSecretary" value="<%= rs.getInt("user_id") %>"></td>
                    <td><input type="radio" class="form-control" name="orgPro" value="<%= rs.getInt("user_id") %>"></td>
                </tr>
                <% } %>
                </table>
                
                <input type="submit" class="form-control" value="Submit">
        </form>
            
        </div>
        
        
        
    </body>
</html>
