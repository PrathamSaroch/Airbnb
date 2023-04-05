
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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

@MultipartConfig
public class UserShowBlockDatesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String detailid = request.getParameter("detailid");
            String owneremail="";
            int paymentid =0;
            
            ResultSet rs = DBLoader.executeQuery("select * from owner_properties_detail_table where detailid='"+detailid+"' ");
            if(rs.next())
            {
                owneremail = rs.getString("owneremail");
            }
            
            ResultSet rs2 = DBLoader.executeQuery("select * from user_payment_table where owneremail='"+owneremail+"' and paymentid='"+paymentid+"'  ");
            if(rs2.next())
            {
                paymentid = rs2.getInt("paymentid");
            }
            
//            To be continued

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
