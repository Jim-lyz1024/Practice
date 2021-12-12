import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * @date 2021年12月12日 15:11
 */
public class JDBCTest {
	public static void main(String[] args) {
		long begin = System.currentTimeMillis();
		try {
			DataSource ds = new ComboPooledDataSource("test");
			Connection conn = (Connection) ds.getConnection();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println("Running time:" + (end - begin));
	}
}
