package servlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ControllerCapNhat extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {

 			response.setContentType("text/html;charset=UTF-8");
			String MSSV = request.getParameter("capnhatMSSV");
			String HoTen = request.getParameter("capnhatHoTen");
			String NgSinh = request.getParameter("capnhatNgaySinh");
			String DiaChi = request.getParameter("capnhatDiaChi");
			String SDT = request.getParameter("capnhatSDT");
				SinhVienModel sv = new SinhVienModel();	
				sv.CapNhatSV(MSSV, HoTen, NgSinh, DiaChi, SDT);
				//request.setAttribute("sinhvien", sv);
				RequestDispatcher rd = request.getRequestDispatcher("/successpage.jsp");
				rd.forward(request, response);
} 
	@Override 
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
