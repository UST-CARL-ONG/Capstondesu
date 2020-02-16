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
@WebServlet(name = "EditServlet2", urlPatterns = {"/EditServlet2"})
public class EditServlet2 extends HttpServlet {

      protected void doPost(HttpServletRequest request, HttpServletResponse response)   
          throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
          
        String sMEMBERID=request.getParameter("MEMBERID");  
        int MEMBERID=Integer.parseInt(sMEMBERID);  
        String MEMBERNAME=request.getParameter("MEMBERNAME");  
        String MEMBERPASS=request.getParameter("MEMBERPASS");  
        String EMAIL=request.getParameter("EMAIL");  
        String COUNTRY=request.getParameter("COUNTRY");  
          
        Emp e=new Emp();  
        e.setMEMBERID(MEMBERID);  
        e.setMEMBERNAME(MEMBERNAME);  
        e.setMEMBERPASS(MEMBERPASS);  
        e.setEMAIL(EMAIL);  
        e.setCOUNTRY(COUNTRY);  
          
        int status=EmpDao.update(e);  
        if(status>0){  
            response.sendRedirect("ViewServlet");  
        }else{  
            out.println("Sorry! unable to update record");  
        }  
          
        out.close();  
    }  
  
}
