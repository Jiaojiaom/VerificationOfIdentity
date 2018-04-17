package db;

public class SystemMsgDAO {
	
	public String getRegistrationSystemStatus() {
		String sql = "select registrationSystemStatus from systemMsg;";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String rs = dbc.queryForList(sql).get(0).get("registrationsystemstatus");
		System.out.println("registrationSystemStatus"+rs);
		dbc.close();
		return rs;
	}
	
	public String getIdentificationSystemStatus() {
		String sql = "select identificationSystemStatus from systemMsg;";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String rs = dbc.queryForList(sql).get(0).get("identificationsystemstatus");
		dbc.close();
		return rs;
	}
	
	public String getRegistStatus() {
		String sql = "select registStatus from systemMsg;";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		String rs = dbc.queryForList(sql).get(0).get("registstatus");
		dbc.close();
		return rs;
	}
	
	public int setRegistrationSystemStatus(int value) {
		String sql = "update systemMsg set registrationSystemStatus =" + value + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public int setIdentificationSystemStatus(int value) {
		String sql = "update systemMsg set identificationSystemStatus =" + value + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
	
	public int setRegistStatus(int value) {
		String sql = "update systemMsg set registStatus =" + value + ";";
		DBConnection dbc = new DBConnection();
		dbc.createConnection();
		int i = dbc.update(sql);
		dbc.close();
		return i;
	}
}
