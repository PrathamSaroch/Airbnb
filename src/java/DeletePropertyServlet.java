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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

/**
 *
 * @author Dell
 */
public class DeletePropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String propertyname = request.getParameter("propertyname");
            
            System.out.println("Property name is - "+propertyname );
            
            ResultSet rs = DBLoader.executeQuery("select * from properties_table where propertyname ='"+propertyname+"' ");
            if (rs.next()) {
                
                rs.deleteRow();
                
                out.println("success");
            } else {
                out.println("fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
