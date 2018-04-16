package com.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExportExcelBean {
	
	public HSSFWorkbook exportExcel(ArrayList<Map<String,String>> data) throws Exception{
		HSSFWorkbook wb;
		
		//根据数据生成excel文件
		wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("工作表1");
		
		//创建表头
		HSSFRow row = sheet.createRow(0);
//		if(exportType.equals("candidate")) {
		HSSFCell cell=row.createCell(0);
		cell.setCellValue("考生姓名");
		cell=row.createCell(1);
		cell.setCellValue("性别");
		cell=row.createCell(2);
		cell.setCellValue("证件类型");
		cell=row.createCell(3);
		cell.setCellValue("证件号码");
		cell=row.createCell(4);
		cell.setCellValue("出生日期");
		cell=row.createCell(5);
		cell.setCellValue("户籍所在省份");
		cell=row.createCell(6);
		cell.setCellValue("学校名称");
		cell=row.createCell(7);
		cell.setCellValue("学习形式");
		cell=row.createCell(8);
		cell.setCellValue("院系/班级");
		cell=row.createCell(9);
		cell.setCellValue("电子邮箱");
		cell=row.createCell(10);
		cell.setCellValue("手机号码");
		cell=row.createCell(11);
		cell.setCellValue("通信地址");
		cell=row.createCell(11);
		cell.setCellValue("考点名称");
		cell=row.createCell(13);
		cell.setCellValue("考场号");
		cell=row.createCell(14);
		cell.setCellValue("座位号");
		cell=row.createCell(15);
		cell.setCellValue("比对相似度");
		
		//创建数据
		if(data!=null&&data.size()>0){
			Map<String,String> info = null;
			for(int i=0;i<data.size();i++) {
				info = data.get(i);
				row = sheet.createRow(i+1);
				cell=row.createCell(0);
				cell.setCellValue(info.get("stuname"));
				cell=row.createCell(1);
				if(info.get("sex").equals("F"))
					cell.setCellValue("女");
				else
					cell.setCellValue("男");
				cell=row.createCell(2);
				if(info.get("cardtype").equals("0"))
					cell.setCellValue("居民身份证");
				else if(info.get("cardtype").equals("1"))
					cell.setCellValue("军人证");
				else if(info.get("cardtype").equals("2"))
					cell.setCellValue("港澳居民住来内地通行证");
				else if(info.get("cardtype").equals("3"))
					cell.setCellValue("台湾居民来往大陆通行证");
				else cell.setCellValue("护照");
				cell=row.createCell(3);
				cell.setCellValue(info.get("cardid"));
				cell=row.createCell(4);
				cell.setCellValue(info.get("birth"));
				cell=row.createCell(5);
				cell.setCellValue(info.get("provincename"));
				cell=row.createCell(6);
				cell.setCellValue(info.get("collegename"));
				cell=row.createCell(7);
				if(info.get("studytype").equals("0"))
					cell.setCellValue("普通全日制");
				else
					cell.setCellValue("非全日制");
				cell=row.createCell(8);
				cell.setCellValue(info.get("academyclass"));
				cell=row.createCell(9);
				cell.setCellValue(info.get("email"));
				cell=row.createCell(10);
				cell.setCellValue(info.get("phonenumber"));
				cell=row.createCell(11);
				cell.setCellValue(info.get("address"));
				cell=row.createCell(11);
				cell.setCellValue(info.get("testingpointname"));
				cell=row.createCell(13);
				if(info.get("examlocationid")==null||info.get("examlocationid").length()==0)
					cell.setCellValue("无");
				else
					cell.setCellValue(info.get("examlocationid"));
				cell=row.createCell(14);
				if(info.get("examseatnumber")==null||info.get("examseatnumber").length()==0)
					cell.setCellValue("无");
				else
					cell.setCellValue(info.get("examseatnumber"));
				cell=row.createCell(15);
				cell.setCellValue(info.get("semblance"));
			}
		}
		return wb;
//		}
	}
}
