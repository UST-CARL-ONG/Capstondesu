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
@WebServlet(name = "Emp", urlPatterns = {"/Emp"})
public class Emp extends HttpServlet {

private int MEMBERID;  
private String MEMBERNAME,MEMBERPASS,EMAIL,COUNTRY;  
public int getMEMBERID() {  
    return MEMBERID;  
}  
public void setMEMBERID(int MEMBERID) {  
    this.MEMBERID = MEMBERID;  
}  
public String getMEMBERNAME() {  
    return MEMBERNAME;  
}  
public void setMEMBERNAME(String MEMBERNAME) {  
    this.MEMBERNAME = MEMBERNAME;  
}  
public String getMEMBERPASS() {  
    return MEMBERPASS;  
}  
public void setMEMBERPASS(String MEMBERPASS) {  
    this.MEMBERPASS = MEMBERPASS;  
}  
public String getEMAIL() {  
    return EMAIL;  
}  
public void setEMAIL(String EMAIL) {  
    this.EMAIL = EMAIL;  
}  
public String getCOUNTRY() {  
    return COUNTRY;  
}  
public void setCOUNTRY(String COUNTRY) {  
    this.COUNTRY = COUNTRY;  
}  
  
}
