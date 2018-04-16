package com.stu.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class DeleteEnlistAction extends ActionSupport{
	private String rs;
	
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
		int i = sdao.updateEnlistInfo(cardId);
		if(i>0) {
			rs = "alert('删除成功！'); window.location.href='enlist.jsp';";
			return SUCCESS;
		}else {
			rs = "alert('删除失败！'); window.location.href='enlist.jsp';";
			return LOGIN;
		}
	}
	
}
