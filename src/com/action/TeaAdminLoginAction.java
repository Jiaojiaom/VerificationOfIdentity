package com.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.AdminMsgDAO;
import db.TeacherMsgDAO;

public class TeaAdminLoginAction extends ActionSupport{
	private String collegeId;
	private String id;
	private String password;
	private String role;
	private String rs;
	
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String execute() throws Exception{
		int tip;
		if(role.equals("tea")) {
			TeacherMsgDAO teadao = new TeacherMsgDAO();
			tip = teadao.checkLog(id, collegeId, password);
			if(tip == 2) {
				Map<String,String> teaMsg = teadao.getTeaMsg(id, collegeId);
				HttpSession session = ServletActionContext.getRequest().getSession();
				System.out.println("session:" + teaMsg.get("testingpointid"));
				session.setAttribute("teaId", id);
				session.setAttribute("collegeId", collegeId);
				session.setAttribute("teaName", teaMsg.get("teaname"));
				session.setAttribute("testingPointName", teaMsg.get("testingpointname"));
				session.setAttribute("testingPointId", teaMsg.get("testingpointid"));
				session.setAttribute("examLocationId", teaMsg.get("examlocationid"));
				session.setAttribute("building", teaMsg.get("building"));
				session.setAttribute("classroom", teaMsg.get("classroom"));
				session.setAttribute("isLogined","yes");
				return SUCCESS + role;
			}
		}else{
			AdminMsgDAO admindao = new AdminMsgDAO();
			tip = admindao.checkLog(id, password);
			if(tip == 2) {
				String adminName = admindao.getAdminName(id);
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("adminId", id);
				session.setAttribute("adminName", adminName);
				session.setAttribute("isLogined","yes");
				return SUCCESS + role;
			}
		}
		if(tip==1) {
			rs = "alert('密码输入有误，请重新输入！'); window.location.href='login.jsp';";
		}else if(tip==0){
			rs = "alert('所在学校或工号输入有误，请重新输入！'); window.location.href='login.jsp';";
		}else {
			rs = "alert('工号输入有误，请重新输入！'); window.location.href='login.jsp';";
		}
		return LOGIN;
	}
	
}
