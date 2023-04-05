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
public class AdminCityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {

            String cityname = request.getParameter("cityname");
            String desc = request.getParameter("desc");

            Part p1 = request.getPart("photo");
            String relpath = "/myphotos";
            String abspath = request.getServletContext().getRealPath(relpath);

            String newname = System.currentTimeMillis() + ".jpg";
            String filename = FileUploader.savefileonserver(p1, abspath, newname);
            String photo1 = "./myphotos/" + filename;

            ResultSet rs = DBLoader.executeQuery("select * from city_table where cityname= '"+cityname+"' ");
            if (rs.next()) {
                out.println("fail");
            } else {
                    rs.moveToInsertRow();
                    rs.updateString("cityname", cityname);
                    rs.updateString("desc", desc);
                    rs.updateString("photo", photo1);
                    rs.insertRow();
                out.println("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
