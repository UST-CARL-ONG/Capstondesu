/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package organization;

import java.io.File;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//import javax.servlet.http.HttpSession;

/**
 *
 * @author JoshuaDC
 */

@WebServlet(name = "Save", urlPatterns = {"/Save"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
        maxFileSize = 1024 * 1024 * 10, //10MB
        maxRequestSize = 1024*1024 * 50)
public class Save extends HttpServlet {

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
//            out.println("<title>Servlet Save</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Save at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/organissembly"
                    + "?zeroDateTimeBehavior=convertToNull", "root", "");
            
            String orgName = request.getParameter("orgName");
            String orgDescription = request.getParameter("orgDescription");
            String orgVision = request.getParameter("orgVision");
            String orgMission = request.getParameter("orgMission");
            Part part = request.getPart("orgImage");
            String fileName = extractFileName(part);
            String savePath = "C:\\Users\\JoshuaDC\\Documents\\NetBeansProjects\\Capstondesu\\web\\orgImages" + File.separator + fileName;
            File fileSaveDir = new File(savePath);
            String orgAdviserID = request.getParameter("orgAdviser");
            String orgPresidentID = request.getParameter("orgPresident");
            String orgVicePresidentID = request.getParameter("orgVicePresident");
            String orgSecretaryID = request.getParameter("orgSecretary");
            String orgProID = request.getParameter("orgPro");
            
            /* Saves file to orgImages folder */
            part.write(savePath + File.separator);
         
            /* SQL to insert inputs from CreateOrg.jsp to Organizations table resulting to a new organization.*/
            String insertOrgSql = "insert into organizations "
                    + "(org_name, org_imageDir, org_description, "
                    + "org_vision, org_mission, org_adviserName, "
                    + "org_presidentName, org_vicePresidentName, org_secretaryName, "
                    + "org_proName)"
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(insertOrgSql);
            
            String selectUserNamesSql = "SELECT "
                    + "users.user_firstName, "
                    + "users.user_middleName, "
                    + "users.user_lastName "
                    + "FROM useraccounts "
                    + "WHERE user_id IN (?, ?, ?, ?, ?)";
            
            ps.setString(1, orgName);
            ps.setString(2, savePath);
            ps.setString(3, orgDescription);
            ps.setString(4, orgVision);
            ps.setString(5, orgMission);
            ps.setString(6, orgAdviserID);
            ps.setString(7, orgPresidentID);
            ps.setString(8, orgVicePresidentID);
            ps.setString(9, orgSecretaryID);
            ps.setString(10, orgProID);
            ps.executeUpdate();
            
            /* SQL to assign the roles from the selected users to their respective organization. 
            Inserts into Members table. */
            String rolesToMemberSql = "insert into members (member_userId, member_orgId, member_isActive, member_role)"
                    + "values "
                    + "(?, ?, ?, ?),"
                    + "(?, ?, ?, ?),"
                    + "(?, ?, ?, ?),"
                    + "(?, ?, ?, ?),"
                    + "(?, ?, ?, ?)";
                    
            
            PreparedStatement ps2 = conn.prepareStatement(rolesToMemberSql);
            
            /* SQL to select the ID of the recently made organization. */
            String orgIdSql = "select organizations.org_id from organizations order by org_id desc limit 1";
            
            Statement stmt2 = conn.createStatement();
            
            ResultSet rs2 = stmt2.executeQuery(orgIdSql);
            rs2.next();
            
            ps2.setString(1, orgAdviserID);
            ps2.setString(5, orgPresidentID);
            ps2.setString(9, orgVicePresidentID);
            ps2.setString(13, orgSecretaryID);
            ps2.setString(17, orgProID);
            
            for(int counter = 1 ;counter <= 20; counter = counter + 4){
                ps2.setInt(counter + 1, rs2.getInt(1));
                ps2.setInt(counter + 2, 1);
                ps2.setString(counter + 3, roleAssign(counter));
            }
            
            ps2.executeUpdate();
            
            /* Selects all organizations and displays to Home.jsp */
            String orgSql = "select organizations.org_id, organizations.org_name, organizations.org_imageDir, "
                        + "organizations.org_isEnabled "
                        + "FROM organizations";
            
            Statement stmt = conn.createStatement();
                
            ResultSet rs = stmt.executeQuery(orgSql);
            
            request.setAttribute("recordsOrg", rs);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
            
        }catch(ClassNotFoundException e){
            Logger.getLogger(Save.class.getName()).log(Level.SEVERE, null, e);
            out.println(e);
            
        }catch(SQLException e){
            Logger.getLogger(Save.class.getName()).log(Level.SEVERE, null, e);
            out.println(e);
        }
    }
    
    private String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String [] items = contentDisp.split(";");
        for(String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1 );
            }
        }
        return "";
    }
    
    private String roleAssign(int counter){
        if(counter < 5){
            return "adviser";
        }else if(counter < 9){
            return "president";
        }else if(counter < 13){
            return "vicepresident";
        }else if(counter< 17){
            return "secretary";
        }else{
            return "pro";
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
    }// </editor-fold>

}
