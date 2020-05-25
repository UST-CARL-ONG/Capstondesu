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
        <h1>Hello <%= session.getAttribute("name") %>!</h1>
        <h2><%= session.getAttribute("email") %> </h2>
        <br>
        <% ResultSet rs = (ResultSet)session.getAttribute("recordsRole"); %>
        <% while(rs.next()){
            if(rs.getString(4).equals("swdc")){
            %>
            <a href="#">ADMIN CONTROLS</a>
            <%}
            }%>
        <br>
        <table border="1" align="center">
		<tr>
			<th>User ID</th>
			<th>User Last Name</th>
                        <th>Member ID</th>
                        <th>Member Role</th>
                        <th>Organization ID</th>
                        <th>Organization Name</th>
		</tr>
		<%  rs.beforeFirst();
                    while (rs.next()) { %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
                                <td><%=rs.getString(3) %></td>
                                <td><%=rs.getString(4) %></td>
                                <td><%=rs.getString(5) %></td>
                                <td><%=rs.getString(6) %></td>
			</tr>	
		<%	}
		%>
	</table>
        <br>
        <table border="1" align="center">
		<tr>
			<th>Organization ID</th>
			<th>Organization Name</th>
                        <th>Organization Description</th>
                        <th>Organization Enabled?</th>
		</tr>
		<%
                        ResultSet rs2 = (ResultSet)session.getAttribute("recordsOrg");
			while (rs2.next()) { %>
			<tr>
				<td><%=rs2.getString(1) %></td>
				<td><%=rs2.getString(2) %></td>
                                <td><%=rs2.getString(3) %></td>
                                <td><%=rs2.getString(4) %></td>
			</tr>	
		<%	}
		%>
	</table>
        
        <br>
        <form action="Logout" method="GET">
            <input type="submit" value="Logout" name="logout">
        </form>
    </body>
</html>
