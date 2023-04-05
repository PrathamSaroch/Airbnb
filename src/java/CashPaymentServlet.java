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
public class CashPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int totalprice = Integer.parseInt(request.getParameter("grandtotal"));
            int detailid = Integer.parseInt(request.getParameter("detailid"));
            String startdate = request.getParameter("startdate");

//            Date startdate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("startdate"));
            String enddate = request.getParameter("enddate");
//            Date enddate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("enddate"));

            String paymenttype = "Cash on Delivery";
            String owneremail = "";
            String address = "";
            int paymentid = 0;

            System.out.println("Total Price is - " + totalprice);

            HttpSession session = request.getSession();
            String useremail = (String) session.getAttribute("useremail");

            ResultSet rs1 = DBLoader.executeQuery("select * from owner_properties_detail_table where detailid='" + detailid + "' ");
            if (rs1.next()) {
                owneremail = rs1.getString("owneremail");
                address = rs1.getString("address");
            }

            ResultSet rs2 = DBLoader.executeQuery("select * from user_payment_table");

            rs2.moveToInsertRow();
            rs2.updateString("owneremail", owneremail);
            rs2.updateString("useremail", useremail);
            rs2.updateInt("detailid", detailid);
            rs2.updateInt("totalprice", totalprice);
            rs2.updateString("paymenttype", paymenttype);
            rs2.updateString("address", address);
            rs2.updateString("startdate", startdate);
            rs2.updateString("enddate", enddate);
            rs2.insertRow();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDate ldStartDate = LocalDate.parse(startdate, formatter);
            LocalDate ldEndDate = LocalDate.parse(enddate, formatter);

            ResultSet rs3 = DBLoader.executeQuery("select max(paymentid) from user_payment_table");
            if (rs3.next()) {
                paymentid = rs3.getInt("max(paymentid)");
                System.out.println(paymentid);
            }

            for (LocalDate date = ldStartDate; date.isBefore(ldEndDate); date = date.plusDays(1)) {
                System.out.println("Date: " + date.toString());
                ResultSet rs4 = DBLoader.executeQuery("select * from user_payment_detail_table");
                rs4.moveToInsertRow();
                rs4.updateString("startperdate", date.format(formatter));
                rs4.updateString("endperdate", date.plusDays(1).format(formatter));
                rs4.updateInt("paymentid", paymentid);
                rs4.insertRow();
            }

            out.println("success");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
