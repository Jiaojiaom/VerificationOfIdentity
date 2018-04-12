package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class StudentMsgDAO {
	
	public int checkLog(String name, String cardId, String pwd) {
		String sql = "select password from studentMsg where cardId = '" + cardId + "' and stuname = '" + name + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ResultSet rs = dbc.queryForRS(sql);
		try {
			while(rs.next()) {
				if(rs.getString("password").equals(pwd)) {
					return 2;
				}
				return 1;
			}
			System.out.println("未进入");
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("出错");
			e.printStackTrace();
		}
		try {
			rs.close();
			dbc.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public ArrayList<Map<String,String>> getStudentMsg(String cardId){
		String sql = "select sex,cardType,birth,provinceId,collegeId,studyType,academyClass,email,phoneNumber,address from studentMsg where cardId = '" +cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		System.out.println(rs.get(0).get("birth"));
		dbc.close();
		return rs;
	}
}
