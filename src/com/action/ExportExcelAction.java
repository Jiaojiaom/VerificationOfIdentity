package com.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.bean.ExportExcelBean;
import com.opensymphony.xwork2.ActionSupport;

import db.StudentMsgDAO;

public class ExportExcelAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private String exportType; //封装说明导出哪个数据表的请求参数
	private String fileName;
	private InputStream excelStream;
	
	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getExportType() {
		return exportType;
	}

	public void setExportType(String exportType) {
		this.exportType = exportType;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String execute() throws Exception{
		StudentMsgDAO sdao = new StudentMsgDAO();
		ArrayList<Map<String,String>> data = null;
		if(exportType.equals("candidate")) {
			data = sdao.exportStu();
			fileName = "考生名单.xls";
		}else if(exportType.equals("absentStu")){
			data = sdao.exportAbsentStu();
			fileName = "缺考名单.xls";
		}else  if(exportType.equals("cheatingStu")){
			data = sdao.exportCheatingStu();
			fileName = "黑名单.xls";
		}
		
		//设置字符，防止乱码
        fileName= new String(fileName.getBytes("UTF-8"),"ISO8859-1");
        
		ExportExcelBean export = new ExportExcelBean();
		HSSFWorkbook workbook = export.exportExcel(data);
		ByteArrayOutputStream output = new ByteArrayOutputStream();
        workbook.write(output);
        byte[] ba = output.toByteArray();
        excelStream = new ByteArrayInputStream(ba);
        System.out.println(excelStream);
        output.flush();
        output.close();
        return SUCCESS;
	}
}
