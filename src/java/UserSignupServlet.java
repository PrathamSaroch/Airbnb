
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
public class UserSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");
        String useremail = request.getParameter("useremail");
        String address = request.getParameter("address");

        System.out.println(username);
        try {

            System.out.println("select * from user_table where useremail='" + useremail + "'");
            ResultSet rs = DBLoader.executeQuery("select * from user_table where useremail=\'" + useremail + "\' ");

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
                rs.updateString("username", username);
                rs.updateString("address", address);
                rs.updateString("password", password);
                rs.updateString("useremail", useremail);
                rs.updateString("phoneno", phoneno);
                rs.updateString("photo", photo1);
                rs.insertRow();

                out.println("success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
