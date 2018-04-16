package db;

import java.util.ArrayList;
import java.util.Map;

public class TestingPointMsgDAO {
	public ArrayList<Map<String,String>> getTestingPointName(){
		String sql = "select testingPointId,testingPointName from testingPointMsg";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
	
	public ArrayList<Map<String,String>> getTPMsg(){
		String sql = "select testingPointId,testingPointName,collegeName,testingPointAddress from testingPointMsg join collegeMsg using(collegeId)";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
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
			sql = "select * from testingPointMsg where testingPointId = " + row.get("tpId") + ";";
			System.out.println(sql);
//			ResultSet exist = dbc.queryForRS(sql);
			ArrayList<Map<String,String>> exist = dbc.queryForList(sql);
			if(exist.size() == 0) {
				sql = "insert into testingPointMsg(testingPointId,testingPointName,cityId,collegeId,testingPointAddress) values(" + row.get("tpId") + ",'" + row.get("tpName") + "'," + row.get("cityId") + "," + row.get("collegeId") + ",'" + row.get("tpAddress") +"');" ;
				System.out.println(sql);
				int flag = dbc.update(sql);
				if(flag>0) {
					System.out.println("考点导入成功");
					index++;
				}
			}
		}
		return index;
	}
}
