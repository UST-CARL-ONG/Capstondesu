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
        <% ResultSet rs = (ResultSet)session.getAttribute("recordsRole");
           session.setAttribute("user_id", session.getAttribute("user_id")); %>
        <% while(rs.next()){
            if(rs.getString(4).equals("swdc")){
            %>
            <a href="View">Create Organization</a>
            <% }
             } %>
        <!--insert roles table code here--> 
        <br>
        <table border="1" align="center">
		<tr>
			<th>Organization ID</th>
			<th>Organization Name</th>
                        <th>Organization Description</th>
                        <th>Organization Enabled?</th>
		</tr>
		<%
                        ResultSet rs2 = (ResultSet)request.getAttribute("recordsOrg");
			while (rs2.next()) { %>
			<tr>
				<td><%=rs2.getString(1) %></td>
				<td><%=rs2.getString(2) %></td>
                                <td><%=rs2.getString(3) %></td>
                                <td><%=rs2.getString(4) %></t d>
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
