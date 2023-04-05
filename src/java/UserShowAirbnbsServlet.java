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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.DBLoader;
import vmm.FileUploader;
import vmm.RDBMS_TO_JSON;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class UserShowAirbnbsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String city = request.getParameter("city");

            System.out.println("City is - " + city);

            ResultSet rs = DBLoader.executeQuery("select * from owner_table where city='" + city + "' and status = 'Approved' ");

            String ans = "";

            JSONObject mainobj = new JSONObject();
            JSONArray arr = new JSONArray();

            while (rs.next()) {
                String airbnbname = rs.getString("airbnbname");

                String owneremail = rs.getString("owneremail");
                ResultSet rs2 = DBLoader.executeQuery("select * from owner_properties_detail_table where owneremail ='" + owneremail + "' ");

                while (rs2.next()) {
                    String propertyname = rs2.getString("propertyname");
                    String photo = rs2.getString("photo");
                    String price = rs2.getString("price");
                    String offerprice = rs2.getString("offerprice");
                    String desc = rs2.getString("desc");
                    owneremail = rs2.getString("owneremail");
                    int detailid = rs2.getInt("detailid");

                    JSONObject subobj = new JSONObject();
                    subobj.put("propertyname", propertyname);
                    subobj.put("photo", photo);
                    subobj.put("price", price);
                    subobj.put("offerprice", offerprice);
                    subobj.put("desc", desc);
                    subobj.put("owneremail", owneremail);
                    subobj.put("detailid", detailid);
                    subobj.put("airbnbname", airbnbname);

                    arr.add(subobj);
                }
                //fire query

            }
            mainobj.put("ans", arr);
            out.println(mainobj);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
