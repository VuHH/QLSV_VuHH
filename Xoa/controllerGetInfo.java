package servlet;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
public class controllerGetInfo extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String MSSV = request.getParameter("capnhatMSSV");	
		SinhVienModel sv = new SinhVienModel();	
		sv = sv.getSV(MSSV);
		String capnhatHoTen =  sv.getName();
		Date NgaySinh = sv.getDoB();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String capnhatNgaySinh = df.format(NgaySinh);
		String capnhatDiaChi = sv.getAddress();
		String capnhatSDT = sv.getPhone();
		request.setAttribute("capnhatHoTen", capnhatHoTen);
		request.setAttribute("capnhatNgaySinh", capnhatNgaySinh);
		request.setAttribute("capnhatDiaChi", capnhatDiaChi);
		request.setAttribute("capnhatSDT", capnhatSDT);
		RequestDispatcher rd = request.getRequestDispatcher("/CapNhatSinhVien.jsp");
		rd.forward(request, response);
	}
@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
