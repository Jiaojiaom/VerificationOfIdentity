package com.tea.action;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class CheckAction extends ActionSupport{
	private String choose;
	private String result;
	private String stuId;
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getChoose() {
		return choose;
	}
	public void setChoose(String choose) {
		this.choose = choose;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	public String execute() throws Exception{
		StudentMsgDAO sdao = new StudentMsgDAO();
		if(sdao.updateCheating(stuId, Integer.parseInt(choose))>0){
			result="alert('已审核！'); window.location.href='authentication.jsp';";
			return SUCCESS;
		}
		result="alert('审核失败！'); window.location.href='check.jsp?stuId=" + stuId +"';";
		return LOGIN;
	}
}
