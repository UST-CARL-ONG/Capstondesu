<%-- 
    Document   : CreateOrgAdviser
    Created on : May 29, 2020, 5:43:39 PM
    Author     : JoshuaDC
--%>

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
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>Create Organization - Organissembly</title>
    </head>
    <body>
        <form action="CreateOrgPresident" method="POST">
            <input type="hidden" name="orgName" value="<%=request.getParameter("orgName")%>">
            <input type="hidden" name="orgDescription" value="<%=request.getParameter("orgDescription")%>">
            <input type="hidden" name="orgVision" value="<%=request.getParameter("orgVision")%>">
            <input type="hidden" name="orgMission" value="<%=request.getParameter("orgMission")%>">
            <input type="hidden" name="orgImage" value="<%=request.getParameter("orgImage")%>">
            
            
            
        </form>
    </body>
</html>
