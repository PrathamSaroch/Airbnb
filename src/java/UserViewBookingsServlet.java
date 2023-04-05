
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
public class UserViewBookingsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            
HttpSession session = request.getSession();
            String useremail = (String) session.getAttribute("useremail");

//String useremail =  "kanish@gmail.com";
            
            System.out.println("Useremail is -"+useremail);
            
            String ans = new RDBMS_TO_JSON().generateJSON("select * from user_payment_table where useremail='" + useremail + "' ");
            
            out.println(ans);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
