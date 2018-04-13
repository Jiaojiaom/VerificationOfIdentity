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
	private int tip;
	
	public int getTip() {
		return tip;
	}
	public void setTip(int tip) {
		this.tip = tip;
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
		if(role.equals("tea")) {
			TeacherMsgDAO teadao = new TeacherMsgDAO();
			tip = teadao.checkLog(id, collegeId, password);
			if(tip == 2) {
				Map<String,String> teaMsg = teadao.getTeaMsg(id, collegeId);
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("teaId", id);
				session.setAttribute("collegeId", collegeId);
				session.setAttribute("teaName", teaMsg.get("teaname"));
				session.setAttribute("testingPointName", teaMsg.get("testingpointname"));
				session.setAttribute("examLocationId", teaMsg.get("examlocationid"));
				session.setAttribute("building", teaMsg.get("building"));
				session.setAttribute("classroom", teaMsg.get("classroom"));
				return SUCCESS + role;
			}
			return LOGIN;
		}else{
			AdminMsgDAO admindao = new AdminMsgDAO();
			tip = admindao.checkLog(id, password);
			if(tip == 2) {
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("adminId", id);
				return SUCCESS + role;
			}
			return LOGIN;
		}
	}
	
}
