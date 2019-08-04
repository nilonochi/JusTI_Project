import java.io.IOException;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditStatus")
public class EditAppStatus extends HttpServlet{

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException{
		String AppStatus = request.getParameter("ApplOpt");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/justi","root","Asdf1234"); 
			String query = "UPDATE APPL SET APPL_STATUS = ? WHERE APPLICATION_ID = 1111";
			PreparedStatement st = con.prepareStatement(query); 
			if (AppStatus.equalsIgnoreCase("Activate"))
			{
				st.setInt(1, 1);
				st.executeUpdate();
			}
			else if (AppStatus.equalsIgnoreCase("Deactivate"))
			{
				st.setInt(1, 0);
				st.executeUpdate();
			}
			con.close();
		}catch (Exception e)
	    {
		      System.err.println("Got an exception! ");
		      System.err.println(e.getMessage());
		    }
		response.sendRedirect("JusTI_portal_dev.jsp");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			doMethod(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			doMethod(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
