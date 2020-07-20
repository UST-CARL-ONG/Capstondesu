<%-- 
    Document   : Home
    Created on : May 25, 2020, 10:23:56 AM
    Author     : JoshuaDC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Organissembly</title>
    </head>
    <body>
        <h1>Hello <%= session.getAttribute("user_name") %>!</h1>
        <h2><%= session.getAttribute("user_email") %> </h2>
        <br>
            <a href="View">Create Organization</a>
        <br>
        <table border="1" align="center">
		<tr>
			<th>Organization Logo</th>
			<th>Organization Name</th>
                        <th>Actions</th>
		</tr>
<!--            org id
                org name
                org imagedir
                org isenabled-->
                
		<% ResultSet rs2 = (ResultSet)request.getAttribute("recordsOrg");
			while (rs2.next()) { %>
			<tr>
                            <td><img src="orgImages/<%= rs2.getString(3) %>" height="100px" width="100px"></td>
                                <td><%=rs2.getString(2) %></td>
                                <td>ID: <%= rs2.getString(1) %>
                                    <% if(rs2.getInt(4) == 1){ %> 
                                        <form method="POST" action="RegisterOrg">
                                            <input type="hidden" name="org_id" value="<%= rs2.getString(1) %>">
                                            <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
                                            <input type="submit" value="Register">
                                        </form>
                                        <form method="POST" action="ViewOrgPage">
                                            <input type="hidden" name="org_id" value="<%= rs2.getString(1) %>">
                                            <input type="submit" value="Enter">
                                        </form>
                                        <form method="POST" action="DisableOrg">
                                            <input type="hidden" name="org_id" value="<%= rs2.getString(1) %>">
                                            <input type="submit" value="Disable">
                                        </form>
                                        
                                <% } else { %>
                                <button disabled="">Register</button>
                                <form method="POST" action="EnableOrg">
                                    <input type="hidden" name="org_id" value="<%= rs2.getString(1) %>">
                                    <input type="submit" value="Enable">
                                </form>
                                <% } %>
                                </td>
			</tr>	
		<% } %>
	</table>
        
        <br>
        <form action="Logout" method="GET">
            <input type="submit" value="Logout" name="logout">
        </form>
    </body>
</html>
