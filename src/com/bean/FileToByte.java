package com.bean;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileToByte {
	
	public byte[] FileToByte(File file) {
		byte[] fileByte = null;
		try {
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			byte[] b =new byte[1024];
			int n;
			while((n = fis.read(b)) > 0) {
				bos.write(b,0,n);
			}
			fis.close();
			bos.close();
			fileByte = bos.toByteArray();
			return fileByte;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileByte;
	}
}
