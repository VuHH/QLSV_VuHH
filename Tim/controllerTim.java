package servlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
public class controllerTim extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			String MSSV = request.getParameter("MSSV");
			SinhVienModel sv = new SinhVienModel();	
			sv = sv.getSV(MSSV);
			String kt = sv.getID();
			if (kt != null) {
				request.setAttribute("sinhvien", sv);
				RequestDispatcher rd = request.getRequestDispatcher("/TimSVjsp.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/notFindjsp.jsp");
				rd.forward(request, response);
			}
} 
	@Override 
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
