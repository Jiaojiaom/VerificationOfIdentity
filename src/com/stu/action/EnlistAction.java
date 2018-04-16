package com.stu.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class EnlistAction extends ActionSupport{
	private String testingPointId;
	private String subjectId;
	private String rs;
	public String getTestingPointId() {
		return testingPointId;
	}
	public void setTestingPointId(String testingPointId) {
		this.testingPointId = testingPointId;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	
	public String execute() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String cardId = (String) session.getAttribute("cardId");
		
		StudentMsgDAO sdao= new StudentMsgDAO();
		if(sdao.queryFaceToken(cardId)==null) {
			rs = "alert('请先上传图片！'); window.location.href='login.jsp';";
			return LOGIN;
		}
		int i = sdao.updateEnlistInfo(cardId, testingPointId, subjectId);
		if(i>0) {
			rs = "alert('报名成功！'); window.location.href='enlist.jsp';";
			return SUCCESS;
		}else {
			rs = "alert('报名失败！'); window.location.href='enlist.jsp';";
			return LOGIN;
		}
	}
}
