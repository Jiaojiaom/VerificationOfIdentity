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
	
	public int importTable(ArrayList<Map<String,String>> data, String tpId) {
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String sql;
		int index = 0;
		for(int i=0;i<data.size();i++) {
			Map<String,String> row = data.get(i);
			sql = "select * from examDistributionMsg where disId = " + row.get("elId") + " and testingPointId = " + tpId + ";";
			System.out.println(sql);
//			ResultSet exist = dbc.queryForRS(sql);
			ArrayList<Map<String,String>> exist = dbc.queryForList(sql);
			if(exist.size() == 0) {
				sql = "insert into examDistributionMsg(disId,testingPointId,building,classroom,containNumber) values(" + row.get("elId") + "," + tpId + ",'" + row.get("elName") + "','" + row.get("elClass") + "'," + row.get("containNum") +");" ;
				System.out.println(sql);
				int flag = dbc.update(sql);
				if(flag>0) {
					System.out.println("考场导入成功");
					index++;
				}
			}
		}
		return index;
	}
}
