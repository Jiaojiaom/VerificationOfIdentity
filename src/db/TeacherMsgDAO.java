package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public ArrayList<Map<String,String>> getTeaMsgForAdmin(){
		String sql = "select teaId,teaName,collegeName,phoneNumber,testingPointName from teacherMsg join collegeMsg using(collegeId) join testingPointMsg using(testingPointId)";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public int importTable(ArrayList<Map<String,String>> data) {
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String sql;
		int index = 0;
		for(int i=0;i<data.size();i++) {
			Map<String,String> row = data.get(i);
			sql = "select * from teacherMsg where teaId = '" + row.get("teaId") + "' and collegeId = " + row.get("collegeId") + ";";
			System.out.println(sql);
//			ResultSet exist = dbc.queryForRS(sql);
			ArrayList<Map<String,String>> exist = dbc.queryForList(sql);
			if(exist.size() == 0) {
				sql = "insert into teacherMsg(teaId,teaName,sex,collegeId,testingPointId,phoneNumber) values('" + row.get("teaId") + "','" + row.get("teaName") + "','" + row.get("sex") + "'," + row.get("collegeId") + "," + row.get("testingPointId") +",'" + row.get("phoneNumber") + "');";
				System.out.println(sql);
				int flag = dbc.update(sql);
				if(flag>0) {
					System.out.println("教师导入成功");
					index++;
				}
			}
		}
		return index;
	}
}
