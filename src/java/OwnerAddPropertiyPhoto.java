
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
public class OwnerAddPropertiyPhoto extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int detailid = Integer.parseInt(request.getParameter("detailid"));
        
        System.out.println("Detail id is - " +detailid);
        try {
ResultSet rs  = DBLoader.executeQuery("select * from owner_properties_photos_table");
                //Extract incomming file
                Part photo = request.getPart("photo");
                String absolutepath = request.getServletContext().getRealPath("/myphotos");
                String newname = System.currentTimeMillis() + ".jpg";
                String filename = FileUploader.savefileonserver(photo, absolutepath, newname);
                String photo1 = "./myphotos/" + filename;

                rs.moveToInsertRow();
                rs.updateString("photo", photo1);
                rs.updateInt("detailid", detailid);
                rs.insertRow();

                out.println("success");
            }

         catch (Exception e) {
            e.printStackTrace();
        }
    }

}
