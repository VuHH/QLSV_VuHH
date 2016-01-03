package servlet;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
public class SinhVienModel {
	private String MSSV;
	private String HOTEN;
	private Date NGAYSINH ;
	private String SDT;
	private String DIACHI;
	
	public String getName() {
		return HOTEN;
	}
	public String getID() {
		return MSSV;
	}
	public Date getDoB() {
		return NGAYSINH;
	}
	public String getPhone() {
		return SDT;
	}
	public String getAddress() {
		return DIACHI;
	}
	public void setID(String id) {
		this.MSSV = id;
	}
	public void setName(String Name) {
		this.HOTEN = Name;
	}
	public void setDoB(Date date) {
		this.NGAYSINH = date;
	}
	public void setAddress(String address) {
		this.DIACHI = address;
	}
	public void setPhone(String phone) {
		this.SDT = phone;
	}
	//@SuppressWarnings("null")
	public SinhVienModel  getSV(String MSSV) {
		config cf = new config();
		Connection conn = null;
		SinhVienModel sv = new SinhVienModel();
		ResultSet rs = null;
		try {
			conn = cf.connectDatabase();
			Statement statement = conn.createStatement();
			String sql = "SELECT MSSV,HOTEN,NGAYSINH,SDT,DIACHI" +
						  " FROM SINHVIEN" + " WHERE MSSV = '" + MSSV + "'";
			rs = statement.executeQuery(sql);
			while (rs.next()==true) {
				sv.MSSV = rs.getString("MSSV");
				sv.HOTEN = rs.getString("HOTEN");
				sv.NGAYSINH = rs.getDate("NGAYSINH");
				sv.DIACHI = rs.getString("DIACHI");
				sv.SDT = rs.getString("SDT");
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println("error SQL!");
		}
		return sv;	
	}
	public ArrayList<SinhVienModel> getAllSv() {
		config cf = new config();
		Connection conn = null;
		
		ArrayList<SinhVienModel> svarrList = new ArrayList<SinhVienModel>();
		ResultSet rs = null;
		try {
			conn = cf.connectDatabase();
			Statement statement = conn.createStatement();
			String sql = "SELECT MSSV,HOTEN,NGAYSINH,SDT,DIACHI" +
						  " FROM SINHVIEN";
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				SinhVienModel sv = new SinhVienModel();
				sv.setID(rs.getString("MSSV"));
				sv.setName(rs.getString("HOTEN"));
				sv.setDoB(rs.getDate("NGAYSINH"));
				sv.setAddress(rs.getString("DIACHI"));
				sv.setPhone(rs.getString("SDT"));
				svarrList.add(sv);
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println("error SQL!");
		}
		return svarrList;
	}
	public void XoaSV(String MSSV) {
		config cf = new config();
		Connection conn = null;
		try {
			conn = cf.connectDatabase();
			Statement statement = conn.createStatement();
			String sql = "DELETE FROM sinhvien WHERE MSSV = '" + MSSV + "'";
			statement.execute(sql);
			conn.close();
		} catch (SQLException e) {
			System.out.println("error SQL!");
		}
	}
	public void CapNhatSV(String MSSV,String HoTen,String NgSinh,String DiaChi,String SDT) {
		config cf = new config();
		Connection conn = null;
		try {
			conn = cf.connectDatabase();
			Statement statement = conn.createStatement();
			String sql = "UPDATE sinhvien SET HOTEN='"+ HoTen 
						  +"',NGAYSINH='"+ NgSinh
						  +"',SDT='"+ SDT
						  +"',DIACHI='"+ DiaChi
						  +"'WHERE MSSV='"+ MSSV +"'";
			statement.execute(sql);
			conn.close();
		} catch (SQLException e) {
			System.out.println("error SQL!");
		}
	}
	public boolean ThemSV(String MSSV,String HoTen,String NgSinh,String DiaChi,String SDT) {
		config cf = new config();
		Connection conn = null;
		try {
			conn = cf.connectDatabase();
			Statement statement = conn.createStatement();
			String sql = "INSERT INTO sinhvien(MSSV,HOTEN,NGAYSINH,SDT,DIACHI) "
						+ "VALUES ('"+ MSSV +"','"+ HoTen +"','" 
						+  NgSinh +"','"+ SDT +"','"+ DiaChi +"')";
			statement.execute(sql);
			conn.close();
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
}

