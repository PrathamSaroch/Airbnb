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
public class DeleteCityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String city = request.getParameter("city");
            
            System.out.println("City is - "+city );
            
            ResultSet rs = DBLoader.executeQuery("select * from city_table where cityname ='"+city+"' ");
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
