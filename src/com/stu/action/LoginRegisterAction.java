package com.stu.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class LoginRegisterAction extends ActionSupport{
	private String stuName;
	private String cardId;
	private String password;
	private int tip;
	
	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTip() {
		return tip;
	}

	public void setTip(int tip) {
		this.tip = tip;
	}

	public String login() throws Exception{
		System.out.println(stuName);
		StudentMsgDAO stuDao = new StudentMsgDAO();
		tip = stuDao.checkLog(stuName,cardId, password);
		if(tip == 2) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("stuName", stuName);
			session.setAttribute("cardId", cardId);
			return SUCCESS;
		}
		System.out.println(tip);
		return LOGIN;
	}
}
