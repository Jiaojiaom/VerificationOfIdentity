package db;

import java.util.ArrayList;
import java.util.Map;

public class SubjectMsgDAO {
	public ArrayList<Map<String,String>> getSubjectName(){
		String sql = "select subjectId,subjectName from subjectMsg";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
