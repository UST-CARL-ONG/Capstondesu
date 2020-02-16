/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crud;

import java.util.*;  
import java.sql.*;  
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
@WebServlet(name = "EmpDao", urlPatterns = {"/EmpDao"})
public class EmpDao extends HttpServlet {
public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/portal?zeroDateTimeBehavior=convertToNull", "root", "");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(Emp e){  
        int status=0;  
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into user905(MEMBERNAME,MEMBERPASS,EMAIL,COUNTRY) values (?,?,?,?)");  
            ps.setString(1,e.getMEMBERNAME());  
            ps.setString(2,e.getMEMBERPASS());  
            ps.setString(3,e.getEMAIL());  
            ps.setString(4,e.getCOUNTRY());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int update(Emp e){  
        int status=0;  
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "update user905 set MEMBERNAME=?,MEMBERPASS=?,EMAIL=?,COUNTRY=? where MEMBERID=?");  
            ps.setString(1,e.getMEMBERNAME());  
            ps.setString(2,e.getMEMBERPASS());  
            ps.setString(3,e.getEMAIL());  
            ps.setString(4,e.getCOUNTRY());  
            ps.setInt(5,e.getMEMBERID());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int delete(int MEMBERID){  
        int status=0;  
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("delete from user905 where id=?");  
            ps.setInt(1,MEMBERID);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    public static Emp getEmployeeById(int MEMBERID){  
        Emp e=new Emp();  
          
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from user905 where id=?");  
            ps.setInt(1,MEMBERID);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                e.setMEMBERID(rs.getInt(1));  
                e.setMEMBERNAME(rs.getString(2));  
                e.setMEMBERPASS(rs.getString(3));  
                e.setEMAIL(rs.getString(4));  
                e.setCOUNTRY(rs.getString(5));  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return e;  
    }  
    public static List<Emp> getAllEmployees(){  
        List<Emp> list=new ArrayList<Emp>();  
          
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from user905");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Emp e=new Emp();  
                e.setMEMBERID(rs.getInt(1));  
                e.setMEMBERNAME(rs.getString(2));  
                e.setMEMBERPASS(rs.getString(3));  
                e.setEMAIL(rs.getString(4));  
                e.setCOUNTRY(rs.getString(5));  
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
}
