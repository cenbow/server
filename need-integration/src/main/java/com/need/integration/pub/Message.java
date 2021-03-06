package com.need.integration.pub;

import java.util.LinkedHashMap;
import java.util.Map;

import com.need.integration.util.PropertiesUtil;



/**
 * <p></p>
 * 
 * @author Rylan 2015年7月22日 下午7:42:59
 * @ClassName Message
 * @Description TODO
 * @version V1.0
 * @modificationHistory=========================逻辑或功能性重大变更记录
 * @modify by user: Rylan 2015年7月22日
 * @modify by reason:{方法名}:{原因}
 */
public class Message {
	public final static Integer SUCCESS = 200;

	private final static String CONFIG_URL = "/properties/message.properties";

	private int code = 200;

	private String msg = "";

	private Map<String, Object> data=new LinkedHashMap<String, Object>();

	public Message() {

	}

	
	public Message(String type) {
		this.msg = PropertiesUtil.getProperty(CONFIG_URL, type + "");
	}

	public Message(int code, Map<String, Object> args) {
		this.msg = PropertiesUtil.getProperty(CONFIG_URL, code + "");
		this.code = code;
		this.data = args;
	}

	public Message(int code, String message, Map<String, Object> args) {
		this.code = code;
		this.msg = message;
		this.data = args;
	}

	public static Message success() {
		return new Message(200, new LinkedHashMap<String, Object>());
	}

	public static Message warn(int code) {
		return new Message(code, null);
	}

	public static Message error(int code) {
		return new Message(code, null);
	}

	public static Message error(int code, String content) {
		return new Message(code, content, null);
	}

	public static Message success(Map<String, Object> args) {
		return new Message(200, args);
	}

	public static Message warn(int type, Map<String, Object> args) {
		return new Message(type, args);
	}

	public static Message error(int type, Map<String, Object> args) {
		return new Message(type, args);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String toString() {
		return this.msg;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data){
		this.data = data;
	}
	
	
	
	public void addData(String key, Object arg) {
		if(this.data==null){
			data=new LinkedHashMap<String, Object>();
		}
		data.put(key, arg);
	}

}
