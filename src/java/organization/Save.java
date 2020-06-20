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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            int orgAdviserID = Integer.parseInt(request.getParameter("orgAdviser"));
            int orgPresidentID = Integer.parseInt(request.getParameter("orgPresident"));
            int orgVicePresidentID = Integer.parseInt(request.getParameter("orgVicePresident"));
            int orgSecretaryID = Integer.parseInt(request.getParameter("orgSecretary"));
            int orgProID = Integer.parseInt(request.getParameter("orgPro"));
            
            part.write(savePath + File.separator);
         
            String insertOrgSql = "insert into organizations "
                    + "(org_name, org_imageDir, org_description, "
                    + "org_vision, org_mission, org_adviserId, "
                    + "org_presidentId, org_vicePresidentId, org_secretaryId, "
                    + "org_proId)"
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(insertOrgSql);
            
            ps.setString(1, orgName);
            ps.setString(2, savePath);
            ps.setString(3, orgDescription);
            ps.setString(4, orgVision);
            ps.setString(5, orgMission);
            ps.setInt(6, orgAdviserID);
            ps.setInt(7, orgPresidentID);
            ps.setInt(8, orgVicePresidentID);
            ps.setInt(9, orgSecretaryID);
            ps.setInt(10, orgProID);
            
            ps.executeUpdate();
            
            response.sendRedirect("Home.jsp");
            
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
