package servlet;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.jsp.jstl.sql.Result;
//import javax.servlet.jsp.jstl.sql.ResultSupport;  
public class controllerXemChiTiet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<SinhVienModel> arrSV = new ArrayList<SinhVienModel>();	
		SinhVienModel sv = new SinhVienModel();	
		arrSV = sv.getAllSv();
		request.setAttribute("allsinhvien", arrSV);
		request.getParameter("pages");
		RequestDispatcher rd = request.getRequestDispatcher("/TTSV.jsp");
		rd.forward(request, response);
	}
@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
