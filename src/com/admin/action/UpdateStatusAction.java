package com.admin.action;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;
import db.SystemMsgDAO;

public class UpdateStatusAction extends ActionSupport{
	private String functionType;
	private String status;
	private String rs;
	
	public String getFunctionType() {
		return functionType;
	}
	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	
	public String execute() throws Exception{
		SystemMsgDAO smdao = new SystemMsgDAO();
		ServletContext application = ServletActionContext.getRequest().getSession().getServletContext();
		if(functionType.equals("rsStatus")) {
			System.out.println("status:" + status);
			if(status.equals("0")){
				StudentMsgDAO sdao = new StudentMsgDAO();
				sdao.deleteStu();
			}
			smdao.setRegistrationSystemStatus(Integer.parseInt(status));
			application.setAttribute("rsStatus", status);
		}else if(functionType.equals("rStatus")) {
			smdao.setRegistStatus(Integer.parseInt(status));
			application.setAttribute("rStatus", status);
		}else {
			smdao.setIdentificationSystemStatus(Integer.parseInt(status));
			application.setAttribute("isStatus", status);
		}
		rs = "alert('设置成功！'); window.location.href='setting.jsp';";
		return SUCCESS;
	}
}
