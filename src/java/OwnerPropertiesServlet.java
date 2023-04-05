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

/**
 *
 * @author Dell
 */
@MultipartConfig
public class OwnerPropertiesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String price = request.getParameter("price");
            String offerprice = request.getParameter("offerprice");
            String propertyname = request.getParameter("propertyname");
            String address = request.getParameter("address");
            String desc = request.getParameter("desc");

            HttpSession session = request.getSession();
            String owneremail = (String) session.getAttribute("owneremail");

            Part photo = request.getPart("photo");

            String absolutepath = request.getServletContext().getRealPath("/myphotos");
            String newname = System.currentTimeMillis() + ".jpg";
            String filename = FileUploader.savefileonserver(photo, absolutepath, newname);
            String photo1 = "./myphotos/" + filename;
            
            String city = "";

            System.out.println("Property name is - " + propertyname);
            System.out.println("Price is - " + price);
            
            ResultSet rs = DBLoader.executeQuery("select city from owner_table where owneremail ='"+owneremail+"' ");
            if(rs.next())
            {
                city = rs.getString("city");
            }
            
            ResultSet rs2 = DBLoader.executeQuery("select * from owner_properties_detail_table ");
//            if(rs2.next())
//            {
//                out.println("fail");
//            }
//            else
//            {
                
                rs2.moveToInsertRow();
                rs2.updateString("owneremail", owneremail);
                rs2.updateString("propertyname", propertyname);
                rs2.updateString("city", city);
                rs2.updateString("photo", photo1);
                rs2.updateString("price", price);
                rs2.updateString("offerprice", offerprice);
                rs2.updateString("desc", desc);
                rs2.updateString("address", address);
                rs2.insertRow();
                
                out.println("success");
//            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
