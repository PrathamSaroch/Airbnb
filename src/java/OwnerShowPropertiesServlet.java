/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.naming.spi.DirStateFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm.FileUploader;
import vmm.RDBMS_TO_JSON;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class OwnerShowPropertiesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession();
            String owneremail = (String) session.getAttribute("owneremail");
            
            String ans = new RDBMS_TO_JSON().generateJSON("select * from owner_properties_detail_table where owneremail = '"+owneremail+"' ");
            
            System.out.println(ans);
            
            out.println(ans);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
