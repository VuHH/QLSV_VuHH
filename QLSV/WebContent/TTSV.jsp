<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="servlet.SinhVienModel"  %>
<%@ page import="java.util.*"  %>
<%@ page import="java.util.Calendar"  %>
<%@ page import="servlet.controllerTim" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thong tin sinh vien</title>
<link rel="stylesheet" href="css.css">
 
</head>
<body>
	<% ArrayList<SinhVienModel> arrSV = (ArrayList<SinhVienModel>)request.getAttribute("allsinhvien"); 
	String number = request.getParameter("pages");
	int sodong = arrSV.size();
	int no_of_page;
	int pages = 0;
	int start_row_count;
	int end_row_count;
	String page_name = "controllerXemChiTiet";
	%>
	
	<div class="">
	<table border = 1px id="results" class="table">
		<tr>
			<th>MSSV</th>
			<th>HO TEN</th>
			<th>NGAY SINH</th>
			<th>SDT</th>
			<th>DIA CHI</th>
		</tr>
		<% if (sodong % 10 == 0) {
			no_of_page = sodong/10;
		} else {
			no_of_page = sodong/10 +1;
		}
		
		if (number != null) {
			pages = Integer.parseInt(number);
		}
		if (pages == 0) pages = 1;
		if (pages == 1) {
			start_row_count=0;
		} else {
			start_row_count=(pages-1)*10;
		}
		end_row_count=(pages*10)-1;
		%>
		<% 
		for (int i =start_row_count;i<=end_row_count;i++) { 
			if(i < sodong) {
			SinhVienModel sv = arrSV.get(i);
			String MSSV = sv.getID();
			   String HoTen = sv.getName();
			   Date NgSinh = sv.getDoB();
			   Calendar cal = Calendar.getInstance();
			   cal.setTime(NgSinh);
			   int year = cal.get(Calendar.YEAR);
			   int month = cal.get(Calendar.MONTH);
			   month = month + 1;
			   int day = cal.get(Calendar.DAY_OF_MONTH);
			   String SDT  = sv.getPhone();
			   String DiaChi = sv.getAddress();
		
		%>
				<tr>
					<td><%out.print(sv.getID());%></td>
					<td><%out.print(sv.getName());%></td>
					<td><%out.print(day+"-"+month+"-"+year);%></td>
					<td><%out.print(sv.getPhone());%></td>
					<td><%out.print(sv.getAddress());%></td>
					<td>
						<input type="button" value="Xoa" onclick ="XoaFunc(<%out.print(MSSV);%>)">
					</td>					
						<input type="hidden" name="capnhatMSSV" value="<%out.print(MSSV);%>">
					<td><input type="button" value="Cap Nhat" onclick="CapNhatAllFunc('<%out.print(MSSV);%>')"></td>
				</tr>
				<% } else {
					break;
				}
				%>
				<% } %>
	</table>
	<%	
	for(int i=1;i<=no_of_page;i++)
	{
		//out.println("<a href='"+ page_name +"?pages=" + i +">"+i+"</a>");
		out.println("<input type='button' id='myBtn'  onclick='pagingPage(this)' value='"+ i +"'>");
	}
	%>
	</div>

</body>
</html>