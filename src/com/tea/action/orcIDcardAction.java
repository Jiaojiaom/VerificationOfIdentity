package com.tea.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.bean.FileToByte;
import com.bean.OrcIDcard;
import com.megvii.cloud.http.CardOperate;
import com.megvii.cloud.http.Response;
import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;
import net.sf.json.JSONObject;

public class orcIDcardAction extends ActionSupport{
	private File cardImg;
	private String cardImgContentType;
	private String cardImgFileName;
	private String examLocationId;
	private String testingPointId;
	private Map<String,Object> result = new HashMap<String,Object>();
	
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	public String getTestingPointId() {
		return testingPointId;
	}
	public void setTestingPointId(String testingPointId) {
		this.testingPointId = testingPointId;
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
	
	public String execute() throws Exception{
		
		OrcIDcard oid = new OrcIDcard();
		oid.cardRecognition(cardImg);
		if(oid.getStatus() == 200) {
			Map<String,String> msg = oid.getCardMsg();
			if(msg == null) {
				result.put("result", "cardError"); 
				return LOGIN;
			}
			StudentMsgDAO sdao = new StudentMsgDAO();
			System.out.println(msg.get("birth"));
			int tip = sdao.checkIdentity(msg,examLocationId,testingPointId);
			System.out.println(tip);
			if(tip == 1) {
				result.put("result", "success");
				result.put("cardId", msg.get("cardId"));
				return SUCCESS;
			}else if(tip == 2){
				result.put("result", "error");
				result.put("cardId", msg.get("cardId"));
				return LOGIN;
			}else {
				result.put("result", "noPerson");
				return LOGIN;
			}
		}
		result.put("result", "fail");
//		result = JSONObject.fromObject(rs);
		return LOGIN;
	}
}
