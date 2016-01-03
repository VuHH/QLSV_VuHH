package servlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerXoa extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			String MSSV =(String)request.getParameter("XoaMSSV");
			SinhVienModel sv = new SinhVienModel();	
			sv.XoaSV(MSSV);
			RequestDispatcher rd = request.getRequestDispatcher("/successpage.jsp");
			rd.forward(request, response);
} 
	@Override 
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
