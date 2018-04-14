package com.tea.action;

import java.io.File;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.bean.FaceCompare;
import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class FaceCompareAction extends ActionSupport{
	private File faceImg;
	private String faceImgContentType;
	private String faceImgFileName;
	private String stuId;
	private String savePath;
	private int tip = 3;
	
	@SuppressWarnings("deprecation")
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public File getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(File faceImg) {
		this.faceImg = faceImg;
	}
	public String getFaceImgContentType() {
		return faceImgContentType;
	}
	public void setFaceImgContentType(String faceImgContentType) {
		this.faceImgContentType = faceImgContentType;
	}
	public String getFaceImgFileName() {
		return faceImgFileName;
	}
	public void setFaceImgFileName(String faceImgFileName) {
		this.faceImgFileName = faceImgFileName;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public int getTip() {
		return tip;
	}
	public void setTip(int tip) {
		this.tip = tip;
	}
	
	public String execute() throws Exception{
		StudentMsgDAO sdao = new StudentMsgDAO();
		String realPath = getSavePath() + "/" + sdao.queryFaceToken(stuId);
		File orginImg = new File(getSavePath() + "/" + sdao.queryFaceToken(stuId));
		FaceCompare fc = new FaceCompare();
		fc.faceRecognition(faceImg, orginImg);
		System.out.println(fc.getStatus());
		if(fc.getStatus() == 200) {
			Map<String,Double> rs = fc.getResultMsg();
			System.out.println(rs.get("confidence"));
			if(rs.get("confidence")>rs.get("1e-5")) {
				tip = 4; //是同一个人
				return SUCCESS;
			}else {
				tip = 5; //不是同一张人
				return LOGIN;
			}
		}
		tip = 2; //无法比对
		return LOGIN;
	}
}
