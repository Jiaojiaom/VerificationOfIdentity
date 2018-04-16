package com.stu.action;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class EditInfoAction extends ActionSupport{
	private String type;
	private String stuName;
	private String stuSex;
	private String cardType;
	private String cardId;
	private String birth;
	private String provinceId;
	private String collegeId;
	private String studyType;
	private String academyClass;
	private String email;
	private String phoneNumber;
	private String address;
	private String rs;
	
	
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getStudyType() {
		return studyType;
	}
	public void setStudyType(String studyType) {
		this.studyType = studyType;
	}
	public String getAcademyClass() {
		return academyClass;
	}
	public void setAcademyClass(String academyClass) {
		this.academyClass = academyClass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String execute() throws Exception{
		StudentMsgDAO sdao = new StudentMsgDAO();
		if(type.equals("regist")) {
			int i = sdao.insertStu(stuName, stuSex, cardType, cardId, birth, provinceId, collegeId, studyType, academyClass, email, phoneNumber, address);
			if(i>0){
				rs = "alert('注册成功'); window.location.href='login.jsp';";
			}else {
				rs = "alert('已注册，可直接登录！'); window.location.href='login.jsp';";
			}
		}else {
			int i = sdao.updateStu(cardId, provinceId, collegeId, studyType, academyClass, email, phoneNumber, address);
			System.out.println(i);
			if(i>0){
				rs = "alert('修改成功'); window.location.href='editInfo.jsp';";
			}
		}
		System.out.println(rs);
		return SUCCESS;
	}
}
