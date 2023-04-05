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
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String useremail = request.getParameter("useremail");
            String password = request.getParameter("password");
            
            System.out.println(useremail);
            System.out.println(password);

            ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail='" + useremail + "' and password = '" + password + "' ");
            if (rs.next()) {
                
                HttpSession session = request.getSession();
                session.setAttribute("useremail", useremail);
                
                out.println("success");
            } else {
                out.println("fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
