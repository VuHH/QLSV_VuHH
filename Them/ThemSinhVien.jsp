<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Them Sinh Vien</title>
<link rel="stylesheet" href="css.css">
<script>
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function validateForm() {
	
	var x = document.forms["myForm"]["MSSV"].value;
    if (x == null || x == "") {
        alert("Vui long dien day du thong tin vao form");
        return false;
    }
    var dd = document.getElementById("Ngay");
    var mm = document.getElementById("Thang");
    var yy = document.getElementById("Nam");
    var Ngay = dd.options[dd.selectedIndex].value;
    var Thang = mm.options[mm.selectedIndex].value;
    var Nam = yy.options[yy.selectedIndex].value;
    if ((Ngay == 0) || (Thang == 0) || (Nam == 0)) {
    	alert("Vui long nhap ngay thang nam");
    	return false;
    }
  	//var MSSV = checkMSSV();
  	//document.write(MSSV);
	//var txtMSSV =  document.getElementById("MSSV");
}
function loadketqua() {
	var x = document.forms["myForm"]["MSSV"].value;
    if (x == null || x == "") {
        alert("Vui long dien day du thong tin vao form");
        return false;
    }
	
	var MSSV = document.getElementById("MSSV").value;
	var HoTen = document.getElementById("HoTen").value;
	var dd = document.getElementById("Ngay");
	var mm = document.getElementById("Thang");
	var yy = document.getElementById("Nam");
	var Ngay = dd.options[dd.selectedIndex].value;
	var Thang = mm.options[mm.selectedIndex].value;
	var Nam = yy.options[yy.selectedIndex].value;
	 if ((Ngay == 0) || (Thang == 0) || (Nam == 0)) {
	    	alert("Vui long nhap ngay thang nam");
	    	return false;
	    }
	var DiaChi = document.getElementById("DiaChi").value;
	
	var SDT = document.getElementById("SDT").value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		//alert(xhttp.readyState);
		if (xhttp.readyState == 4 && xhttp.status == 200) { 
			//alert(xhttp.responseText);
			document.getElementById("noidung").innerHTML = xhttp.responseText;
		}
	};
	var tmp =confirm("Are u sure ?"); 
	if (tmp == true) {
		xhttp.open("POST","controllerThem",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("MSSV="+ MSSV +"&HoTen="+HoTen+"&Ngay="+Ngay+"&Nam="
				   +Nam+"&Thang="+Thang+"&DiaChi="+DiaChi+"&SDT="+SDT);
			
	}
	if (tmp == false){
		history.go(1);
	} 
	//document.getElementById("myForm").submit();	
}
</script>
</head>
<body>
	<header id="header"> 
		<div class="innertube">
		<h1>Xem Chi Tiet</h1> 
		</div>	
	</header>
	<main>
		<div id="content">
			<div class="innertube">
				<h1>THEM SINH VIEN</h1>
				
				
				<form name="myForm" onsubmit="return validateForm()">
				<div class="formCapNhat">
				<p id="noidung"></p>
				<table>
				<tr>
					<td>MSSV</td>
					<td><input type="text" id = "MSSV" name="MSSV" placeholder="MSSV" maxlength="5" onkeypress="return isNumber(event)" style="width: 180px;" >(*)</td>
				
				</tr>
				<tr>
					<td></td>
					<td ><small><i><font size="2" style="padding-left:50px">* Nhap toi da 5 ky tu</font></i></small></td>
				</tr>	
				<tr>
					<td>Ho vaTen</td>
					<td><input type="text" id="HoTen" name="HoTen"  style="width: 180px;" placeholder="Ho va Ten" ></td>
				</tr>
				<tr>
					<td>Ngay Sinh</td>
					<td>
						<select style="margin-left:50px" id="Ngay" name = "Ngay">
							<option value = "0" selected="selected">Ngay</option>
							<%
								for(int i = 1; i<=31 ; i ++) {
									out.println("<option value = '"+ i +"'id='Ngay'>"+ i +"</option>");
								}
							%>
						</select>
						<select id="Thang" name = "Thang">
							<option value = "0" >Thang</option>
							<%
								for(int i = 1; i<=12 ; i ++) {
									out.println("<option value = '"+ i +"'id='Thang'>"+ i +"</option>");
								}
							%>
						</select>
						<select id="Nam" name = "Nam">
							<option value = "0" >Nam</option>
							<%
								for(int i = 1900; i<=2015 ; i ++) {
									out.println("<option value = '"+ i +"'id='Nam'>"+ i +"</option>");
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>Dia Chi</td>
					<td><input type="text" name="DiaChi" id="DiaChi" placeholder="Dia chi" style="width: 180px;"></td>
				</tr>
				<tr>
					<td>SDT</td>
					<td><input type="text" name="SDT" id="SDT" placeholder="So Dien Thoai" style="width: 180px;"></td>
				</tr>
			</table>
				

			<input type="button" value="Them" style="margin-top:10px" onclick = "loadketqua()">
		</div>
		</form>		
		</div>
		</div>
		</main>
		
			<nav id="nav">
					<div class="innertube">
					<ul>
						<li><a class="active" href="TrangChu.jsp">Home</a></li>
						<li><a href="XemThongTinSinhVien.jsp">Xem chi tiet</a></li>
						<li><a href="ThemSinhVien.jsp">Them Sinh Vien</a></li>
					</ul>
					</div>
			</nav>
</body>
</html>