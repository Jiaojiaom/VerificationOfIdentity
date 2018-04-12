package db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import  java.util.Properties;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import  java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import  java.io.IOException; 

public class DBConnection implements java.io.Serializable{
	private String driver;
	private String url;
	private String user;
	private String pwd;
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	/**
	 * DBConnection构造函数从参数文件中读取数据库连接参数
	 */
	public DBConnection(){
		//从properties文件中读取数据库连接参数
		Properties prop =  new  Properties();
		try  {
			InputStream in = getClass().getResourceAsStream("/db.properties");
            prop.load(in);    
            this.setDriver(prop.getProperty( "driver" ));    
            this.setUrl(prop.getProperty( "url" ));
            this.setUser(prop.getProperty( "username" ));
            this.setPwd(prop.getProperty( "password" ));
            if(in != null)  in.close();  
        }  catch  (IOException e) {    
            e.printStackTrace();    
        }  
		
	}
	
	/**
	 * createConnection函数连接数据库
	 */
	public void createConnection(){
		try{
			Class.forName(driver);
			con = (Connection) DriverManager.getConnection(url,user,pwd);
			System.out.println("success");
		}catch (ClassNotFoundException e) {
			//System.out.println("fail");
			e.printStackTrace();
		} catch (SQLException e) {
			//System.out.println("fail");
			e.printStackTrace();
		}
	}
	
	/**
	 * queryForRS函数从数据库中查询记录，得到相应的结果集
	 * @param sql:数据库查询语句
	 * @return 查询到的结果集
	 */
	public ResultSet queryForRS(String sql){
		ResultSet rs=null;
		try{
			stmt=(Statement) con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs=stmt.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	//执行查询
	/**
	 * queryForList函数从数据库中查询记录，得到相应的结果集，把结果集中的数据封装到ArrayList类型中
	 * @param sql：数据库查询语句
	 * @return 把结果集中的数据封装到ArrayList类型，返回ArrayList类型变量
	 */
	public  ArrayList<Map<String,String>> queryForList(String sql){
		ArrayList<Map<String,String>> results=null;
		try {
			stmt=(Statement) con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs=stmt.executeQuery(sql);
			if(rs!=null){
				results=new ArrayList<Map<String,String>>();
				while(rs.next()){
					Map<String,String> result=new HashMap<String,String>();
					ResultSetMetaData rsmd=rs.getMetaData();
					int columnCount=rsmd.getColumnCount();
					for(int i=1;i<=columnCount;i++){
						String fieldName=rsmd.getColumnName(i).toLowerCase();
						String fieldValue=rs.getString(i);
						result.put(fieldName, fieldValue);
					}
					results.add(result);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	
	/**
	 * update函数执行更新类的SQL语句：insert,update,delete
	 * @param sql:数据库查询语句
	 * @return 数据库更新记录的数量
	 */
	public int update(String sql){
		int i=0;
		try {
			stmt=(Statement) con.createStatement();
			i=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * setsetAutoCommit函数用来设置数据库是否自动提交事务
	 * @param flag:数据库是否自动提交事务（false:禁止自动提交，true:自动提交）
	 * @throws SQLException 
	 */
	public void setAutoCommit(boolean flag) throws SQLException{
		con.setAutoCommit(flag);
	}
	
	/**
	 * setCommit函数用来统一提交事务
	 * @throws SQLException
	 */
	public void setCommit() throws SQLException{
		con.commit();
	}
	
	/**
	 * setRollback函数用来撤销事务
	 */
	public void setRollback(){
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("�ع�ʧ�ܣ�");
			e.printStackTrace();
		}
	}
	
	/**
	 *closeConnection函数关闭数据库连接 
	 */
	public void close(){
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
}
