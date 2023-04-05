
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm.FileUploader;

@MultipartConfig
public class OwnerSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String airbnbname = request.getParameter("airbnbname");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");
        String owneremail = request.getParameter("owneremail");
        String cityname = request.getParameter("cityname");
        String status = "Pending";

        System.out.println(name);
        try {

            System.out.println("select * from owner_table where owneremail='" + owneremail + "'");
            ResultSet rs = DBLoader.executeQuery("select * from owner_table where owneremail=\'" + owneremail + "\' ");

            if (rs.next()) {
                out.println("fail");
            } else {
                //Extract incomming file
                Part photo = request.getPart("photo");
                String absolutepath = request.getServletContext().getRealPath("/myphotos");
                String newname = System.currentTimeMillis() + ".jpg";
                String filename = FileUploader.savefileonserver(photo, absolutepath, newname);
                String photo1 = "./myphotos/" + filename;

                rs.moveToInsertRow();
                rs.updateString("ownername", name);
                rs.updateString("airbnbname", airbnbname);
                rs.updateString("city", cityname);
                rs.updateString("password", password);
                rs.updateString("owneremail", owneremail);
                rs.updateString("phoneno", phoneno);
                rs.updateString("status", status);
                rs.updateString("photo", photo1);
                rs.insertRow();

                out.println("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
