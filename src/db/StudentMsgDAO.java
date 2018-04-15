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
		String sql = "select sex,cardType,birth,provinceId,collegeId,studyType,academyClass,email,phoneNumber,address,face_token from studentMsg where cardId = '" +cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		System.out.println(rs.get(0).get("birth"));
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getAbsentStuFromPlace(String examLocationId){
		String sql = "select cardId,stuname,examSeatNumber,phoneNumber from studentMsg where examLocationId = " + examLocationId + " and isCheating = 2;";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getCheatingStuFromPlace(String examLocationId){
		String sql = "select cardId,stuname,examSeatNumber,phoneNumber from studentMsg where examLocationId = " + examLocationId + " and isCheating = 1;";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);	
		dbc.close();
		return rs;
	}
	
	public int updateFaceToken(String cardId,String filename) {
		String sql = "update studentMsg set face_token = '" + filename + "' where cardId = '" + cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public String queryFaceToken(String cardId) {
		String sql = "select face_token from studentMsg where cardId = '" + cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String rs = dbc.queryForList(sql).get(0).get("face_token");
		dbc.close();
		return rs;
	}
	
	public int checkIdentity(Map<String,String> stuMsg, String examLocationId) {
		String sql = "select * from studentMsg where cardId = '" + stuMsg.get("cardId") + "' and stuname = '" + stuMsg.get("name") + "' and sex = '" + stuMsg.get("gender") + "' and birth = '" + stuMsg.get("birth") + "' and examLocationId = " + examLocationId + ";";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		if(rs == null) {
			return 0; //信息不通过
		}else {
			return 1;
		}
	}
	
	public ArrayList<Map<String,String>> getStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId)";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getAbStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId) where isCheating = 2";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getCheatingStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId) where isCheating = 1";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
