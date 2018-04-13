package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class TeacherMsgDAO {
	public int checkLog(String id, String collegeId, String pwd) {
		String sql = "select password from teacherMsg where teaId = '" + id + "' and collegeId = " + collegeId + ";";
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
	
	public  Map<String,String> getTeaMsg(String teaId, String collegeId) {
		String sql = "select teaName, testingPointName, building, classroom, examLocationId from teacherMsg join testingPointMsg using(testingPointId) join examDistributionMsg on examLocationId = disId where teaId = '" + teaId + "' and teacherMsg.collegeId = " + collegeId + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		Map<String,String> rs = dbc.queryForList(sql).get(0);
		return rs;
	}
}
