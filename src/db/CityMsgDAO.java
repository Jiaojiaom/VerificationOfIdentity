package db;

import java.util.ArrayList;
import java.util.Map;

public class CityMsgDAO {
	public ArrayList<Map<String,String>> getCityName(){
		String sql = "select cityId,cityName from cityMsg";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		ArrayList<Map<String,String>> rs = dbc.queryForList(sql);
		dbc.close();
		return rs;
	}
}
