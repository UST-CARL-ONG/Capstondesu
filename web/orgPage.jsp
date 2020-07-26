<%-- 
    Document   : orgPage
    Created on : Jul 18, 2020, 11:45:36 AM
    Author     : JoshuaDC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            int org_id = (Integer)request.getAttribute("org_id");
    
            ResultSet orgInfoResult = (ResultSet)request.getAttribute("orgInfoResult");
            orgInfoResult.next();
            String org_name = orgInfoResult.getString(1);
            String org_description = orgInfoResult.getString(2);
            String org_vision = orgInfoResult.getString(3);
            String org_mission = orgInfoResult.getString(4);
            String org_adviserName = orgInfoResult.getString(5);
            String org_presidentName = orgInfoResult.getString(6);
            String org_vicePresidentName = orgInfoResult.getString(7);
            String org_secretaryName = orgInfoResult.getString(8);
            String org_proName = orgInfoResult.getString(9);
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= org_name %> - Organissembly</title>
    </head>
    <body>
        <p>Organization Name: <%= org_name %></p>
        <p>Organization Description: <%= org_description %></p>
        <p>Organization Vision: <%= org_vision %></p>
        <p>Organization Mission: <%= org_mission %></p>
        <p>Organization Adviser: <%= org_adviserName %></p>
        <p>Organization President: <%= org_presidentName %></p>
        <p>Organization Vice President: <%= org_vicePresidentName %></p>
        <p>Organization Secretary: <%= org_secretaryName %></p>
        <p>Organization PRO: <%= org_proName %></p>
        
        <form action="viewRegisteredMembers" method="POST">
            <input type="hidden" name="org_id" value="<%= org_id %>">
            <input type="submit" value="View Organization Registrants">
        </form>
    </body>
</html>
