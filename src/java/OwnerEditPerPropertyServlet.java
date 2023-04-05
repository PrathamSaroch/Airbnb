
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

@MultipartConfig
public class OwnerEditPerPropertyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String desc = request.getParameter("desc");
        String address = request.getParameter("address");
        String price = request.getParameter("price");
        String offerprice = request.getParameter("offerprice");
        String detailid = request.getParameter("detailid");
        

        try {

            System.out.println("select * from owner_properties_detail_table where detailid='" + detailid + "'");
            ResultSet rs = DBLoader.executeQuery("select * from owner_properties_detail_table where detailid='" + detailid + "' ");
            
            if(rs.next())
            {
            rs.updateString("desc", desc);
            rs.updateString("address", address);
            rs.updateString("price", price);
            rs.updateString("offerprice", offerprice);
            rs.updateRow();
            
            out.println("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
