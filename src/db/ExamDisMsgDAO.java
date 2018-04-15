package db;

import java.util.ArrayList;
import java.util.Map;

public class ExamDisMsgDAO {
	
	public ArrayList<Map<String,String>> getElMsg(int tpid){
		String sql = "select disId,building,classroom,containNumber from examDistributionMsg where testingPointId = " + tpid + ";";
		System.out.println(sql);
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
