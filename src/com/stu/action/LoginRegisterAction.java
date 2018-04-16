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
	private String rs;
	
	public String getRs() {
		return rs;
	}

	public void setRs(String rs) {
		this.rs = rs;
	}

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


	public String login() throws Exception{
		System.out.println(stuName);
		StudentMsgDAO stuDao = new StudentMsgDAO();
		int tip = stuDao.checkLog(stuName,cardId, password);
		if(tip == 2) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("stuName", stuName);
			session.setAttribute("cardId", cardId);
			return SUCCESS;
		}else if(tip == 1){
			rs = "alert('密码输入有误，请重新输入！'); window.location.href='login.jsp';";
		} else
			rs = "alert('姓名或身份证号输入有误，请重新输入！'); window.location.href='login.jsp';";
		return LOGIN;
	}
}
