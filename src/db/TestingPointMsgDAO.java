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
}
