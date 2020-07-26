<%-- 
    Document   : orgNewRegistrantsPage
    Created on : Jul 26, 2020, 5:02:27 PM
    Author     : JoshuaDC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization Registrants - Organissembly</title>
        <%
        ResultSet newRegistrantsResult;
        
        int org_id = (Integer)request.getAttribute("org_id");
        
        newRegistrantsResult = (ResultSet)request.getAttribute("newRegistrantsResult");
        %>
    </head>
    <body>
        <table>
            <tr>
                <th>Name</th>
                <th>Action</th>
            </tr>
            <% 
            while(newRegistrantsResult.next())
            {
                %>
                <tr>
                    <td><%= newRegistrantsResult.getString(1) + " " + newRegistrantsResult.getString(2) %></td>
                    <td>
                        <form method="POST" action="AcceptMember">
                            <input type="hidden" name="member_id" value="<%= newRegistrantsResult.getString(3) %>">
                            <input type="hidden" name="org_id" value="<%= org_id %>">
                            <input type="submit" value="Accept">
                        </form>
                    </td>
                </tr>
                <%
            }
            %>
        </table>
    </body>
</html>
