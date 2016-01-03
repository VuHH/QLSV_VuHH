package servlet;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
public class config {
	public config() {
	}
	public Connection connectDatabase() {
		Connection conn = null;
		try {
			Driver driver = new org.gjt.mm.mysql.Driver();
			DriverManager.registerDriver(driver);
			String conString = "jdbc:mysql://localhost:3306/sinhvien";
			Properties info = new Properties();
			info.setProperty("characterEncoding", "utf8");
			info.setProperty("user", "root");
			info.setProperty("password", "123");
			conn = DriverManager.getConnection(conString,info);
		} catch (SQLException e) {
			System.out.println("error connect database");
		}
		return conn;
	}
}