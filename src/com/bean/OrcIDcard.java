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
import com.megvii.cloud.http.Response;


public class OrcIDcard {
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

	public OrcIDcard() {
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
	
	public void cardRecognition(File file) throws Exception {
		FileToByte ftb = new FileToByte();
		byte[] fileByte = ftb.FileToByte(file);
		CardOperate cardop = new CardOperate(getApiKey(),getApiSecret());
		Response rs = cardop.ocrIDcard("",fileByte,"",0);
		this.setContent(rs.getContent());
		this.setStatus(rs.getStatus());
	}
	
	public Map<String,String> getCardMsg() throws JSONException{
		Map<String,String> result = new HashMap<String,String>();
		String res = new String(content);
		JSONObject json = new JSONObject(res);
		JSONObject card = json.optJSONArray("cards").getJSONObject(0);
		if(card.optString("gender").equals("女")) {
			result.put("gender", "F");
		}else {
			result.put("gender", "M");
		}
		result.put("name", card.optString("name"));
		result.put("cardId", card.optString("id_card_number"));
		result.put("birth", card.optString("birthday"));
		return result;
	}
}
