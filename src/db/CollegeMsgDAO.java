package db;

import java.util.ArrayList;
import java.util.Map;

public class CollegeMsgDAO {
	public ArrayList<Map<String,String>> getCollegeName(){
		String sql = "select collegeId,collegeName from collegeMsg";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
