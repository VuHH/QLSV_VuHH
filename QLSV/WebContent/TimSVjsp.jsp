<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="servlet.SinhVienModel"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.util.Calendar"  %>
<%@ page import="servlet.controllerTim" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TIM SINH VIEN</title>
</head>
<body>
	<h1><font size="3">Thong tin sinh vien</font></h1>
	<% SinhVienModel sv = (SinhVienModel)request.getAttribute("sinhvien"); %>
	<table border = 1px class="table">
		<tr>
			<th>MSSV</th>
			<th>HO TEN</th>
			<th>NGAY SINH</th>
			<th>SDT</th>
			<th>DIA CHI</th>
		</tr>
		<tr>
		<%
		   String MSSV = sv.getID();
		   String HoTen = sv.getName();
		   Date NgSinh = sv.getDoB();
		   String SDT  = sv.getPhone();
		   String DiaChi = sv.getAddress();
		   Calendar cal = Calendar.getInstance();
		   cal.setTime(NgSinh);
		   int year = cal.get(Calendar.YEAR);
		   int month = cal.get(Calendar.MONTH);
		   month = month + 1;
		   int day = cal.get(Calendar.DAY_OF_MONTH);
		%>
			<td><%out.print(sv.getID());%></td>
			<td><%out.print(sv.getName());%></td>
			<td><%out.print(day+"-"+month+"-"+year);%></td>
			<td><%out.print(sv.getPhone());%></td>
			<td><%out.print(sv.getAddress());%></td>
				<% 
				%>	
					
					<input type="hidden" id= "XoaMSSV" value="<%out.print(MSSV);%>" >
					<td>
						<input type="submit" value="Xoa" onclick ="XoaFunc(document.getElementById('XoaMSSV').value)"></td>
					</td>
					
						<input type="hidden" id="capnhatMSSV" value="<% out.print(MSSV); %>"> 
						<input type="hidden" id="capnhatHoTen" value="<% out.print(HoTen); %>">
						<input type="hidden" id="capnhatNgaySinh" value="<% out.print(NgSinh); %>">
						<input type="hidden" id="capnhatDiaChi" value="<% out.print(DiaChi); %>">
						<input type="hidden" id="capnhatSDT" value="<% out.print(SDT); %>">
						<td><input type="button" value="Cap Nhat" onclick="CapNhatFunc()"></td>	
		</tr>
	</table>
	<script>
	</script>
</body>
</html>