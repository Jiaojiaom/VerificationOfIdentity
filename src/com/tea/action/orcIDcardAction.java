package com.tea.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;

import com.bean.FileToByte;
import com.bean.OrcIDcard;
import com.megvii.cloud.http.CardOperate;
import com.megvii.cloud.http.Response;
import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class orcIDcardAction extends ActionSupport{
	private File cardImg;
	private String cardImgContentType;
	private String cardImgFileName;
	private String examLocationId;
	private int tip = 3;
	private String stuId = null;
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getExamLocationId() {
		return examLocationId;
	}
	public void setExamLocationId(String examLocationId) {
		this.examLocationId = examLocationId;
	}
	public File getCardImg() {
		return cardImg;
	}
	public void setCardImg(File cardImg) {
		this.cardImg = cardImg;
	}
	public String getCardImgContentType() {
		return cardImgContentType;
	}
	public void setCardImgContentType(String cardImgContentType) {
		this.cardImgContentType = cardImgContentType;
	}
	public String getCardImgFileName() {
		return cardImgFileName;
	}
	public void setCardImgFileName(String cardImgFileName) {
		this.cardImgFileName = cardImgFileName;
	}
	public int getTip() {
		return tip;
	}
	public void setTip(int tip) {
		this.tip = tip;
	}
	
	public String execute() throws Exception{
//		Response rs = cardRecognition();
//		System.out.println("结果为" + rs.getStatus());
//		if(rs.getStatus() == 200) {
//			System.out.println(rs.getContent());
//		}
		OrcIDcard oid = new OrcIDcard();
		oid.cardRecognition(cardImg);
		if(oid.getStatus() == 200) {
			Map<String,String> rs = oid.getCardMsg();
			StudentMsgDAO sdao = new StudentMsgDAO();
			System.out.println(rs.get("birth"));
			tip = sdao.checkIdentity(rs,examLocationId);
			System.out.println(tip);
			if(tip == 1) {
				this.setStuId(rs.get("cardId"));
				return SUCCESS;
			}else {
				return LOGIN;
			}
		}
		tip = 2; //无法识别身份证
		return LOGIN;
	}
}
