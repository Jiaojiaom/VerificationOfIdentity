package com.bean;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadExcel {
	
	public ArrayList<Map<String,String>> readXls(String path) throws IOException {
		
		FileInputStream is = new FileInputStream(path); 
		Workbook hssfWorkbook = null;
        try {
        		hssfWorkbook = new XSSFWorkbook(is);
        } catch (Exception ex) {
        		hssfWorkbook = new HSSFWorkbook(new FileInputStream(path));
        }
//        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        ArrayList<Map<String,String>> data = new ArrayList<Map<String,String>>();  
        // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            Sheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
            }  
            // 循环行Row  
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
                Row hssfRow = hssfSheet.getRow(rowNum);  
                if (hssfRow != null) {
                		Map<String,String> row =new HashMap<String,String>();
                    Cell teaid = hssfRow.getCell(0);  
                    Cell teaName = hssfRow.getCell(1);  
                    Cell sex = hssfRow.getCell(2);  
                    Cell collegeId = hssfRow.getCell(3);
                    Cell testingPointId = hssfRow.getCell(4);
                    Cell phoneNumber = hssfRow.getCell(5);
                    System.out.println("teaId = " + getValue(teaid));
                    row.put("teaId", getValue(teaid));
                    row.put("teaName", getValue(teaName));
                    row.put("sex", getValue(sex));
                    row.put("collegeId", getValue(collegeId));
                    row.put("testingPointId", getValue(testingPointId));
                    row.put("phoneNumber", getValue(phoneNumber));
                    data.add(row);  
                }  
            }  
        }  
        return data;  
    }  
      
     @SuppressWarnings({ "static-access", "deprecation" })  
    private String getValue(Cell cell) {  
//            if (teaid.getCellType() == teaid.CELL_TYPE_BOOLEAN) {  
//                // 返回布尔类型的值  
//                return String.valueOf(teaid.getBooleanCellValue());  
//            } else if (teaid.getCellType() == teaid.CELL_TYPE_NUMERIC) {  
//                // 返回数值类型的值  
//                return String.valueOf(teaid.getNumericCellValue());  
//            } else {  
//                // 返回字符串类型的值  
    	 			cell.setCellType(CellType.STRING);
                return String.valueOf(cell.getStringCellValue());  
//            }  
        }  
}
