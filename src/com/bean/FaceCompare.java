package com.bean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.json.JSONException;
import org.json.JSONObject;

import com.megvii.cloud.http.CardOperate;
import com.megvii.cloud.http.CommonOperate;
import com.megvii.cloud.http.Response;

public class FaceCompare {
	private String apiKey;
	private String apiSecret;
	private byte[] content;
	private int status;
	
	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getApiSecret() {
		return apiSecret;
	}

	public void setApiSecret(String apiSecret) {
		this.apiSecret = apiSecret;
	}

	public FaceCompare() {
		//从properties文件中读取调用Face++API的密钥参数
		Properties prop =  new  Properties();
		try  {
			InputStream in = getClass().getResourceAsStream("/api.properties");
            prop.load(in);    
            this.setApiKey(prop.getProperty( "apiKey" ));
            this.setApiSecret(prop.getProperty( "apiSecret" ));
            if(in != null)  in.close();  
        }  catch  (IOException e) {    
            e.printStackTrace();    
        } 
	}
	
	public void faceRecognition(File newfile, File ofile) throws Exception {
		FileToByte ftb = new FileToByte();
		byte[] nfileByte = ftb.FileToByte(newfile);
		byte[] ofileByte = ftb.FileToByte(ofile);
//		System.out.println(url);
		CommonOperate cop = new CommonOperate(getApiKey(),getApiSecret(),false);
		Response rs = cop.compare("", "", nfileByte, "", "","", ofileByte, "");
		this.setContent(rs.getContent());
		this.setStatus(rs.getStatus());
	}
	
	public Map<String,Double> getResultMsg(){
		Map<String,Double> result = new HashMap<String,Double>();
		String res = new String(content);
		try {
			JSONObject json = new JSONObject(res);
			double confidence = json.optDouble("confidence");
			JSONObject thresholds = json.optJSONObject("thresholds");
			result.put("confidence", confidence);
			result.put("1e-3", thresholds.optDouble("1e-3"));
			result.put("1e-5", thresholds.optDouble("1e-5"));
		}catch(JSONException e) {
			result = null;
			System.out.println("无人脸");
		}
		return result;
	}
}
