/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;
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
public class UserCheckDatesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int detailid = Integer.parseInt(request.getParameter("detailid"));
            String startdate = request.getParameter("startdate");

            String enddate = request.getParameter("enddate");

            System.out.println("Start Date- " + startdate);
            System.out.println("End Date- " + enddate);

            String owneremail = "";
            int paymentid = 0;
            System.out.println("Detail id is -" + detailid);

         
            int flag = 1;
            ResultSet rs2 = DBLoader.executeQuery("select paymentid from user_payment_table where detailid='" + detailid + "' ");
            while (rs2.next()) {
                System.out.println("Inside RS2");
                paymentid = rs2.getInt("paymentid");

                System.out.println("Payment id is -" + paymentid);
                ResultSet rs3 = DBLoader.executeQuery("select * from user_payment_detail_table where paymentid='"+paymentid+"' ");
  
                while (rs3.next()) {
                    if (startdate.equals(rs3.getString("startperdate")) || enddate.equals(rs3.getString("endperdate"))) {
                        System.out.println("Inside RS3 IF");
                        flag = 0;
                        break;
                    } else {
                        flag = 1;
                    }
                }
                
                if(flag == 0) {
                    break;
                }
            }

            if (flag == 0) {
                System.out.println("False");
                out.println("false");
            } else {
                System.out.println("Success");
                out.println("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
