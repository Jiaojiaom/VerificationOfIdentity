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
		String sql = "select cardId,stuname,sex,cardType,birth,provinceId,collegeId,studyType,academyClass,email,phoneNumber,address,face_token from studentMsg where cardId = '" +cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		System.out.println(rs.get(0).get("birth"));
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getAbsentStuFromPlace(String examLocationId,String tpId){
		String sql = "select cardId,stuname,examSeatNumber,phoneNumber from studentMsg where examLocationId = " + examLocationId + " and isCheating = 2 and testingPointId = "+ tpId + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getCheatingStuFromPlace(String examLocationId,String tpId){
		String sql = "select cardId,stuname,examSeatNumber,phoneNumber from studentMsg where examLocationId = " + examLocationId + " and isCheating = 1 and testingPointId = "+ tpId + ";";
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
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		String face = null;
		if(rs!=null && rs.size()>0) {
			face = dbc.queryForList(sql).get(0).get("face_token");
		}
		dbc.close();
		return face;
	}
	
//	public int checkIdentity(Map<String,String> stuMsg, String examLocationId, String testingPointId) {
//		String sql = "select * from studentMsg where cardId = '" + stuMsg.get("cardId") + "' and stuname = '" + stuMsg.get("name") + "' and sex = '" + stuMsg.get("gender") + "' and birth = '" + stuMsg.get("birth") + "' and examLocationId = " + examLocationId + " and testingPointId = " + testingPointId + ";";
//		System.out.println(sql);
//		DBConnection dbc = new DBConnection();
//		dbc.createConnection();
//		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
//		dbc.close();
//		if(rs == null || rs.size() == 0) {
//			return 0; //信息不通过
//		}else {
//			return 1;
//		}
//	}
	
	public int checkIdentity(Map<String,String> stuMsg, String examLocationId, String testingPointId) {
		String sql = "select stuname,sex,birth from studentMsg where cardId = '" + stuMsg.get("cardId")  + " ' and examLocationId = " + examLocationId + " and testingPointId = " + testingPointId + ";";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		if(rs == null || rs.size() == 0) {
			return 0; //该考场无该人
		}else {
			Map<String,String> info = rs.get(0);
			if(stuMsg.get("name").equals(info.get("stuname")) && stuMsg.get("birth").equals(info.get("birth")) && stuMsg.get("gender").equals(info.get("sex"))) {
				return 1;
			}
			return 2;//信息不相符
		}
	}
	
	public ArrayList<Map<String,String>> getStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId) where testingPointId !='';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getAbStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId) where isCheating = 2 and testingPointId !=''";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getCheatingStuMsgForAdmin(){
		String sql = "select cardId,stuname,collegeName,email,phoneNumber from studentMsg join collegeMsg using(collegeId) where isCheating = 1 and testingPointId !=''";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> exportStu(){
		String sql = "select cardId,stuname,sex,cardType,birth,provinceName,collegeName,studyType,academyClass,email,phoneNumber,address,testingPointName,examLocationId,examSeatNumber,semblance from studentMsg join provinceMsg using(provinceId) join collegeMsg using(collegeId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId where studentMsg.testingPointId !='';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> exportAbsentStu(){
		String sql = "select cardId,stuname,sex,cardType,birth,provinceName,collegeName,studyType,academyClass,email,phoneNumber,address,testingPointName,examLocationId,examSeatNumber,semblance from studentMsg join provinceMsg using(provinceId) join collegeMsg using(collegeId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId where isCheating = 2 and studentMsg.testingPointId !='';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> exportCheatingStu(){
		String sql = "select cardId,stuname,sex,cardType,birth,provinceName,collegeName,studyType,academyClass,email,phoneNumber,address,testingPointName,examLocationId,examSeatNumber,semblance from studentMsg join provinceMsg using(provinceId) join collegeMsg using(collegeId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId where isCheating = 1 and studentMsg.testingPointId !='';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> exportAbsentStu(String examLocationId,String tpId){
		String sql = "select cardId,stuname,sex,cardType,birth,provinceName,collegeName,studyType,academyClass,email,phoneNumber,address,testingPointName,examLocationId,examSeatNumber,semblance from studentMsg join provinceMsg using(provinceId) join collegeMsg using(collegeId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId where isCheating = 2 and studentMsg.testingPointId = " + tpId + " and examLocationId = "+ examLocationId + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> exportCheatingStu(String examLocationId,String tpId){
		String sql = "select cardId,stuname,sex,cardType,birth,provinceName,collegeName,studyType,academyClass,email,phoneNumber,address,testingPointName,examLocationId,examSeatNumber,semblance from studentMsg join provinceMsg using(provinceId) join collegeMsg using(collegeId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId where isCheating = 1 and studentMsg.testingPointId = " + tpId + " and examLocationId = "+ examLocationId + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs =  dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public int insertStu(String stuname,String stuSex,String cardType,String cardId,String birth,String provinceId,String collegeId,String studyType,String academyClass,String email,String phoneNumber,String address) {
		String sql = "insert into studentMsg(cardId,stuname,sex,cardType,birth,provinceId,collegeId,studyType,academyClass,email,phoneNumber,address) values('" + cardId + "','" + stuname + "','" + stuSex + "'," + cardType + ",'" + birth + "'," + provinceId + "," + collegeId + "," + studyType + ",'" + academyClass + "','" + email + "','" + phoneNumber + ",'" + address + "');";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public int updateStu(String cardId,String provinceId,String collegeId,String studyType,String academyClass,String email,String phoneNumber,String address) {
		String sql = "update studentMsg set provinceId = " + provinceId + ", collegeId = " + collegeId + ", studyType = " + studyType+ ", academyClass = '" + academyClass + "', email = '" + email + "', phoneNumber = '" + phoneNumber + "', address = '" + address + "' where cardId = '" + cardId + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public Map<String,String> getEnlistInfo(String cardId) {
		String sql = "select testingPointName,subjectName,cityName from studentMsg join subjectMsg using(subjectId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId join cityMsg on testingPointMsg.cityId = cityMsg.cityId where cardId = '" + cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		Map<String,String> info = null;
		if(rs!=null&&rs.size()>0) {
			info = rs.get(0);
		}
		dbc.close();
		
		return info;
	}
	
	public int updateEnlistInfo(String cardId,String testingPointId,String subjectId) {
		String sql = "update StudentMsg set testingPointId = " + testingPointId + ", subjectId = " + subjectId + " where cardId = '" + cardId + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	public int updateEnlistInfo(String cardId) {
		String sql = "update StudentMsg set testingPointId = null, subjectId = null where cardId = '" + cardId + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public Map<String,String> getExamInfo(String cardId) {
		String sql = "select testingPointName,subjectName,subjectDate,subjectStartTime,subjectEndTime,building,classroom,examSeatNumber from studentMsg join subjectMsg using(subjectId) join testingPointMsg on studentMsg.testingPointId = testingPointMsg.testingPointId join examDistributionMsg on studentMsg.testingPointId = examDistributionMsg.testingPointId and studentMsg.examLocationId = examDistributionMsg.disId where cardId = '" + cardId + "';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		Map<String,String> info = null;
		if(rs!=null&&rs.size()>0) {
			info = rs.get(0);
		}
		dbc.close();
		return info;
	}
	
	public int updateCheating(String stuId, int value) {
		String sql = "update studentMsg set isCheating = " + value + " where cardId = '"  + stuId + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public int updateSemblance(String stuId, double semblance) {
		String sql = "update studentMsg set semblance = " + semblance + " where cardId = '"  + stuId + "';";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public int deleteStu(){
		String sql = "delete from studentMsg where testingPointId is null or testingPointId = '';";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
}
