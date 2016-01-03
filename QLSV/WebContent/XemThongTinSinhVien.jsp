<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
input[type=submit] {
	magin-right: 500px;
}

</style>
<link rel="stylesheet" href="css.css">

</head>
<body>
	<header id="header"> 
		<div class="innertube">
		<h1>Xem Chi Tiet</h1> 
		</div>	
	</header>
	<div id="wrapper">
	<main>
		<div id="content">
			<div class="innertube">
				<h1>THONG TIN SINH VIEN</h1>
				<table>
					<tr>
						<td>
							Nhap MSSV: <input type="text" name="MSSV" id="txtMSSV">
							<input type="submit" value="Tim" id="btTim" onclick="loadinfo(document.getElementById('txtMSSV').value)">
						</td>
						<td>
						</td>
						<td>
							<div class='xemTC'>
							<input type="button" value="Xem Tat Ca" id="btTim" class="btPT" name="all" onclick="loadallinfo()">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<p id="noidung"></p>
						</td>
					</tr>
				</table>
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
<script>
	function loadinfo(MSSV) {
		var MSSV
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
				//document.getElementById("txtMSSV").value = MSSV;
			}
		};
		xhttp.open("POST","controllerTim",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("MSSV="+ MSSV);
	}
	function loadallinfo() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("POST","controllerXemChiTiet",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send();
	}
	function XoaFunc(MSSV) {
		//document.write(MSSV);
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
				//document.getElementById("txtMSSV").value = MSSV;
			}
		};
		//document.write(MSSV);
		var tmp=confirm("Are u sure?");
		if (tmp == true) {
			xhttp.open("POST","ControllerXoa",true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("XoaMSSV="+ MSSV);
			
		}
		if (tmp == false) {
			history.go(1);
		}
	}
	function CapNhatFunc() {
		//document.forms["myForm"].getElementsByTagName("input");
		//var MSSV = document.getElementsByName("capnhat")[0].value
		var MSSV = document.getElementById("capnhatMSSV").value;
		var HoTen = document.getElementById("capnhatHoTen").value;
		var NgSinh = document.getElementById("capnhatNgaySinh").value;
		var DiaChi = document.getElementById("capnhatDiaChi").value;
		var SDT = document.getElementById("capnhatSDT").value;
		var chucnang = 1;
		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
				//document.getElementById("txtMSSV").value = MSSV;
			}
		};
			xhttp.open("POST","CapNhatSinhVien.jsp",true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("capnhatMSSV="+ MSSV +"&capnhatHoTen="+HoTen+"&capnhatNgaySinh="
				+NgSinh+"&capnhatDiaChi="+DiaChi+"&capnhatSDT="+SDT+"&chucnang="+chucnang);
		//document.getElementById("myForm").submit();	
	}
	function CapNhatAllFunc(MSSV) {
		//var MSSV;
		//document.write(MSSV);
		var chucnang =2;
		var xhttp = new XMLHttpRequest();
		//var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("POST","controllerGetInfo",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("capnhatMSSV="+ MSSV+"&chucnang="+chucnang);
	}
	function pagingPage(objButton) {
		//var btValue = document.getElementById("myBtn").value;
		//alert(objButton.value);
		//document.write(objButton.value);
		var page = objButton.value
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
				//document.getElementById("txtMSSV").value = MSSV;
			}
		};
		xhttp.open("POST","controllerXemChiTiet",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("pages="+page);	
	}
	function loadKQCN() {
		var xhttp = new XMLHttpRequest();
		var MSSV = document.getElementById("capnhatMSSV").value;
		var HoTen = document.getElementById("capnhatHoTen").value;
		var dd = document.getElementById("Ngay");
		var mm = document.getElementById("Thang");
		var yy = document.getElementById("Nam");
		var Ngay = dd.options[dd.selectedIndex].value;
		var Thang = mm.options[mm.selectedIndex].value;
		var Nam = yy.options[yy.selectedIndex].value;
		var NgSinh = Nam+"-"+Thang+"-"+Ngay;
		//var NgSinh = document.getElementById("capnhatNgaySinh").value;
		var DiaChi = document.getElementById("capnhatDiaChi").value;
		var SDT = document.getElementById("capnhatSDT").value;
		//var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("noidung").innerHTML = xhttp.responseText;
			}
		};
		var tmp = confirm("Are u sure");
		if (tmp == true) {
			xhttp.open("POST","ControllerCapNhat",true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("capnhatMSSV="+ MSSV +"&capnhatHoTen="+HoTen+"&capnhatNgaySinh="
					+NgSinh+"&capnhatDiaChi="+DiaChi+"&capnhatSDT="+SDT);
	
		}
		if (tmp == false) {
			history.go(1);
		}
}
</script>
</div>	
</body>
</html>