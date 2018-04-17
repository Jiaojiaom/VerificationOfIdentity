package com.tea.action;

import java.io.File;
import java.util.HashMap;
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
	private Map<String,Object> result = new HashMap<String,Object>();
	
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
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
	
	public String execute() throws Exception{
		StudentMsgDAO sdao = new StudentMsgDAO();
		String realPath = getSavePath() + "/" + sdao.queryFaceToken(stuId);
		File orginImg = new File(getSavePath() + "/" + sdao.queryFaceToken(stuId));
		FaceCompare fc = new FaceCompare();
		fc.faceRecognition(faceImg, orginImg);
		System.out.println(fc.getStatus());
		if(fc.getStatus() == 200) {
			Map<String,Double> rs = fc.getResultMsg();
			if(rs==null) {
				result.put("result", "noFace");
				return LOGIN;
			}
			System.out.println(rs.get("confidence"));
			if(rs.get("confidence")>rs.get("1e-5")) { //是同一个人
				if(sdao.updateCheating(stuId, 0)>0&&sdao.updateSemblance(stuId, rs.get("confidence"))>0) {
					result.put("result","success");
					result.put("confidence", rs.get("confidence"));
					return SUCCESS;
				}
			}else {//不是同一张人
				sdao.updateSemblance(stuId, rs.get("confidence")); 
				result.put("result","error");
				result.put("confidence", rs.get("confidence"));
				return LOGIN;
			}
		}
		result.put("result","fail"); //无法比对
		return LOGIN;
	}
}
