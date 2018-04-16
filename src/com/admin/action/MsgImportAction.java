package com.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import com.bean.ReadExcel;
import com.opensymphony.xwork2.ActionSupport;

import db.ExamDisMsgDAO;
import db.StudentMsgDAO;
import db.TeacherMsgDAO;
import db.TestingPointMsgDAO;

public class MsgImportAction extends ActionSupport{
	private File excel; //上传的文件
    private String excelFileName; //上传文件的名称 固定写法：上传的文件+FileName
    private String excelContentType;
    private String result;
    //文件保存路径
  	private String savePath;
  	private String importType;
  	private String tpId;
  	
  	public String getTpId() {
		return tpId;
	}
	public void setTpId(String tpId) {
		this.tpId = tpId;
	}
	public String getImportType() {
		return importType;
	}
	public void setImportType(String importType) {
		this.importType = importType;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	//	public Map<String, String> getResult() {
//		return result;
//	}
//	public void setResult(Map<String, String> result) {
//		this.result = result;
//	}
	public File getExcel() {
		return excel;
	}
	public void setExcel(File excel) {
		this.excel = excel;
	}
	public String getExcelFileName() {
		return excelFileName;
	}
	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}
	public String getExcelContentType() {
		return excelContentType;
	}
	public void setExcelContentType(String excelContentType) {
		this.excelContentType = excelContentType;
	}
	@SuppressWarnings("deprecation")
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
    
	public String execute() throws Exception{
		
//		String newName = excelFileName.substring(excelFileName.lastIndexOf("//")+1);
		String newName = excelFileName;
		String path = getSavePath() + "/" + newName;
		System.out.println(path);

		//上传至服务器
		FileOutputStream fos = new FileOutputStream(path);
		FileInputStream fis = new FileInputStream(getExcel());
		byte[] buffer = new byte[1024];
		int len = 0;
		while((len = fis.read(buffer))>0) {
			fos.write(buffer);
		}
		fos.close();
		fis.close();
		
		//解析文件，得到文件中的内容
		ReadExcel xlsMain = new ReadExcel();
		ArrayList<Map<String,String>> data = xlsMain.readXls(path,importType);
		System.out.println("uplaod success");
		
		//数据传入数据库
		int i = 0;
		if(importType.equals("tea")) {
			TeacherMsgDAO tdao = new TeacherMsgDAO();
			i = tdao.importTable(data);
		}else if(importType.equals("testingPoint")) {
			TestingPointMsgDAO tpdao = new TestingPointMsgDAO();
			i = tpdao.importTable(data);
		}else {
			ExamDisMsgDAO eldao = new ExamDisMsgDAO();
			i = eldao.importTable(data,tpId);
		}
		if(i>0) {
			result = "导入成功！";
			return SUCCESS;
			
		}else {
			result = "导入失败，请检查文件！";
			return LOGIN;
		}
//		Map json = new JSONObject(message);
//		Map<String,String> 
		
//		result = json.toString();
//		result = new HashMap<String,String>();
//		result.put("message", message);
		
		
	}

}
