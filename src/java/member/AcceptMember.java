/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JoshuaDC
 * 
 * This servlet updates the isActive value of a member in the members table
 *  in to a value of 1 meaning the member is now active.
 */
@WebServlet(name = "AcceptMember", urlPatterns = {"/AcceptMember"})
public class AcceptMember extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AcceptMember</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AcceptMember at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/organissembly"
                    + "?zeroDateTimeBehavior=convertToNull", "root", "");
            
            int member_id = Integer.parseInt(request.getParameter("member_id"));
            int org_id = Integer.parseInt(request.getParameter("org_id"));
            
            String updateIsActiveSql = "UPDATE members SET member_isActive = 1 WHERE member_id = ?";
            
            PreparedStatement isActiveStatement;
            
            String selectNewRegistrantsSql = "SELECT "
                    + "useraccounts.user_lastName, "
                    + "useraccounts.user_firstName,"
                    + "members.member_id "
                    + "FROM useraccounts INNER JOIN members "
                    + "ON useraccounts.user_id = members.member_userId "
                    + "WHERE members.member_isActive = 0 AND members.member_orgId = ?";
            
            PreparedStatement newRegistrantsStatement = conn.prepareStatement(selectNewRegistrantsSql);
            
            ResultSet newRegistrantsResult;
            
            isActiveStatement = conn.prepareStatement(updateIsActiveSql);
            
            isActiveStatement.setInt(1, member_id);
            
            isActiveStatement.executeUpdate();
            
            newRegistrantsStatement.setInt(1, org_id);
            newRegistrantsResult = newRegistrantsStatement.executeQuery();
            
            request.setAttribute("newRegistrantsResult", newRegistrantsResult);
            request.setAttribute("org_id", org_id);
            
            request.getRequestDispatcher("orgNewRegistrantsPage.jsp").forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcceptMember.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AcceptMember.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
