package db;

import java.util.ArrayList;
import java.util.Map;

public class ProvinceMsgDAO {
	public ArrayList<Map<String,String>> getProvinceName(){
		String sql = "select provinceId,provinceName from provinceMsg";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
