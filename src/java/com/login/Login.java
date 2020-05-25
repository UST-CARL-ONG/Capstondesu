
package com.login;

import controller.Registration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Break
 */

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Login</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            String dbUserId = null;
            String dbEmail = null;
            String dbPassword = null;
            String dbFirstName = null;
            String dbMiddleName = null;
            String dbLastName = null;
                    
            String accountSql = "select * from useraccounts where user_email=? and user_password=?";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/organissembly?zeroDateTimeBehavior=convertToNull"
                    , "root", "");
            
            PreparedStatement ps = conn.prepareStatement(accountSql);
            
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs= ps.executeQuery();
            
//            PrintWriter out = response.getWriter();
            
            while(rs.next()){
                dbUserId = rs.getString("user_id");
                dbEmail = rs.getString("user_email");
                dbPassword = rs.getString("user_password");
                dbFirstName = rs.getString("user_firstName");
                dbMiddleName = rs.getString("user_middleName");
                dbLastName = rs.getString("user_lastName");
            }
            if (email.equals(dbEmail)&&password.equals(dbPassword)){
               
                HttpSession session = request.getSession();
               
                String fullName;
                
                if(dbMiddleName.isEmpty()){
                    fullName = dbFirstName +" "+dbLastName;
                }else{
                    String middleInitial = Character.toString(dbMiddleName.charAt(0)); 
                    fullName = dbFirstName +" "+ middleInitial +". "+dbLastName;
                }
                
                String roleSql = "SELECT useraccounts.user_id, useraccounts.user_lastName, members.member_id, "
                        + "members.member_role, organizations.org_id, organizations.org_name FROM "
                        + "((useraccounts INNER JOIN members ON useraccounts.user_id = members.member_userId) "
                        + "LEFT JOIN organizations ON members.member_orgId = organizations.org_id) "
                        + "WHERE useraccounts.user_id = ?";
                
                ps = conn.prepareStatement(roleSql);
                
                ps.setString(1, dbUserId);
                rs = ps.executeQuery();
                
                String orgSql = "select organizations.org_id, organizations.org_name, organizations.org_description, "
                        + "organizations.org_isEnabled "
                        + "FROM organizations";
                
                Statement stmt = conn.createStatement();
                
                ResultSet rs2 = stmt.executeQuery(orgSql);
                
                session.setAttribute("email", dbEmail);
                session.setAttribute("name", fullName);
                session.setAttribute("recordsRole", rs);
                session.setAttribute("recordsOrg", rs2);
                
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                rd.include(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
