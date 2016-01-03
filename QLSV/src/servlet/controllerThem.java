package servlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class controllerThem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)  
			 throws ServletException, IOException {
 			response.setContentType("text/html;charset=UTF-8");
			String MSSV = request.getParameter("MSSV");
			String HoTen = request.getParameter("HoTen");
			String Ngay = request.getParameter("Ngay");
			String Thang = request.getParameter("Thang");
			String Nam = request.getParameter("Nam");
			String NgSinh = null;
			if ((Ngay == "0") || (Thang == "0") || (Nam == "0")) {
				RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
			else {
				NgSinh = Nam + "-" + Thang + "-" +Ngay ;
			}
			//String NgSinh = request.getParameter("NgaySinh");
			String DiaChi = request.getParameter("DiaChi");
			String SDT = request.getParameter("SDT");
			boolean kt;
			if ((MSSV != "") && (HoTen != ""))
			{
				SinhVienModel sv = new SinhVienModel();	
				kt = sv.ThemSV(MSSV, HoTen, NgSinh, DiaChi, SDT);
				if (kt == true) {
					RequestDispatcher rd = request.getRequestDispatcher("/successpage.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
				}
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
			
} 
	@Override 
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
