/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crud;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Break
 */
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
public class EditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
           throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        out.println("<h1>Update Employee</h1>");  
        String sMEMBERID=request.getParameter("MEMBERID");  
        int MEMBERID=Integer.parseInt(sMEMBERID);  
          
        Emp e=EmpDao.getEmployeeById(MEMBERID);  
          
        out.print("<form action='EditServlet2' method='post'>");  
        out.print("<table>");  
        out.print("<tr><td></td><td><input type='hidden' name='MEMBERID' value='"+e.getMEMBERID()+"'/></td></tr>");  
        out.print("<tr><td>Name:</td><td><input type='text' name='MEMBERNAME' value='"+e.getMEMBERNAME()+"'/></td></tr>");  
        out.print("<tr><td>Password:</td><td><input type='password' name='MEMBERPASS' value='"+e.getMEMBERPASS()+"'/></td></tr>");  
        out.print("<tr><td>Email:</td><td><input type='email' name='EMAIL' value='"+e.getEMAIL()+"'/></td></tr>");  
        out.print("<tr><td>Country:</td><td>");  
        out.print("<select name='country' style='width:150px'>");  
        out.print("<option>India</option>");  
        out.print("<option>USA</option>");  
        out.print("<option>UK</option>");  
        out.print("<option>Other</option>");  
        out.print("</select>");  
        out.print("</td></tr>");  
        out.print("<tr><td colspan='2'><input type='submit' value='Edit & Save '/></td></tr>");  
        out.print("</table>");  
        out.print("</form>");  
          
        out.close();  
    }  
}
