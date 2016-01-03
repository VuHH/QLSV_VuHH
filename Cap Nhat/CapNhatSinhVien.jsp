<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import ="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cap Nhat</title>
<style>
input[type=text] {
	width: 150px;
	margin-left: 120px;
}
</style>
</head>
<body>
	<h1>
		<font size="3">THONG TIN SINH VIEN <% out.print(request.getParameter("capnhatMSSV")); %></font>
	</h1>

	<div class="formCapNhat">
		<%  String chucnang = request.getParameter("chucnang");
		String HoTen = null;
		String NgSinh = null;
		String DiaChi = null;
		String SDT = null;
		if (chucnang.equals("1")) {
			HoTen = request.getParameter("capnhatHoTen");
			NgSinh = request.getParameter("capnhatNgaySinh");
			DiaChi = request.getParameter("capnhatDiaChi");
			SDT = request.getParameter("capnhatSDT");
		} else {
			HoTen = (String)request.getAttribute("capnhatHoTen");
			NgSinh = (String)request.getAttribute("capnhatNgaySinh");
			DiaChi = (String)request.getAttribute("capnhatDiaChi");
			SDT = (String)request.getAttribute("capnhatSDT");
			//out.print(HoTen);
		}
		String[] tokens = NgSinh.split("-");
		String year = tokens[0];
		String month = tokens[1]; 
		String day = tokens[2];
		int numday= Integer.parseInt(day);
		System.out.println(numday);
		int nummonth= Integer.parseInt(month);
		int numyear= Integer.parseInt(year);

	%>
		<table>
			<tr>
				<td>Ho vaTen</td>
				<td><input type="text" name="capnhatHoTen" id="capnhatHoTen"
					value="<% out.print(HoTen); %>"></td>
			</tr>
			<tr>
				<td>Ngay Sinh</td>
				<td>
					<select style="margin-left:50px" id="Ngay" name="Ngay">
							<%
								for(int i = 1; i<=31 ; i ++) {
									if (i == numday) {
										out.println("<option value = '"+ i +"'id='Ngay'selected='selected'>"+ i +"</option>");
									}
									else {
										out.println("<option value = '"+ i +"'id='Ngay'>"+ i +"</option>");	
									}
									
								}
							%>
					</select>
						<select style="margin-left:4px" id="Thang" name="Thang">
							<%
								for(int i = 1; i<=12 ; i ++) {
									if (i == nummonth) {
										out.println("<option value = '"+ i +"'id='Thang'selected='selected'>"+ i +"</option>");
									}
									else {
										out.println("<option value = '"+ i +"'id='Thang'>"+ i +"</option>");	
									}
								}
							%>
					</select>
						<select style="margin-left:4px" id="Nam" name="Nam">
							<%
								for(int i = 1980; i<=2015 ; i ++) {
									if (i == numyear) {
										out.println("<option value = '"+ i +"'id='Nam'selected='selected'>"+ i +"</option>");
									}
									else {
										out.println("<option value = '"+ i +"'id='Nam'>"+ i +"</option>");	
									}
								}
							%>
					</select></td>
			</tr>
			<tr>
				<td>Dia Chi</td>
				<td><input type="text" name="capnhatDiaChi" id="capnhatDiaChi"
					value="<% out.print(DiaChi); %>"></td>
			</tr>
			<tr>
				<td>SDT</td>
				<td><input type="text" name="capnhatSDT" id="capnhatSDT"
					value="<% out.print(SDT); %>"></td>
			</tr>
		</table>
		<input type="hidden" id="capnhatMSSV" name="capnhatMSSV"
			value="<% out.print(request.getParameter("capnhatMSSV")); %>">
		<input type="button" value="Cap Nhat" onclick="loadKQCN()">
	</div>

</body>
</html>