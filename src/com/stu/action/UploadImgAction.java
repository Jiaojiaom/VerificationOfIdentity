package com.stu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class UploadImgAction extends ActionSupport{
	//封装上传图片属性
	private File img;
	private String imgContentType;
	private String imgFileName;
	//封装学生证件号码
	private String cardId;
	//文件保存路径
	private String savePath;
	//上传结果
	private int tip = 0;
	
	public File getImg() {
		return img;
	}
	public void setImg(File img) {
		this.img = img;
	}
	public String getImgContentType() {
		return imgContentType;
	}
	public void setImgContentType(String imgContentType) {
		this.imgContentType = imgContentType;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	@SuppressWarnings("deprecation")
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public int getTip() {
		return tip;
	}
	public void setTip(int tip) {
		this.tip = tip;
	}
	
	public String execute() throws Exception{
		StudentMsgDAO  studao = new StudentMsgDAO();
		//若已存在该考生照片，则删除旧照片
		if(studao.queryFaceToken(cardId)!=null) {
			File file = new File(getSavePath() + "/" + studao.queryFaceToken(cardId));
			System.out.println(studao.queryFaceToken(cardId));
			file.delete();
		}
		String newName = getCardId() + imgFileName.substring(imgFileName.lastIndexOf('.'));
		System.out.println(getSavePath() + "/" + newName);
		FileOutputStream fos = new FileOutputStream(getSavePath() + "/" + newName);
		FileInputStream fis = new FileInputStream(getImg());
		byte[] buffer = new byte[1024];
		int len = 0;
		while((len = fis.read(buffer))>0) {
			fos.write(buffer);
		}
		int i = studao.updateFaceToken(cardId, newName);
		if( i > 0) {
			setTip(1);
		}
		return SUCCESS;
	}
	
}
