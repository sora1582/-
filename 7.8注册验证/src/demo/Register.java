package demo;

import java.util.Map;
import java.util.HashMap;

public class Register {
	//本类用于完成提交信息的验证
	private String name;//定义name属性
	private String age;//定义age属性，定义位string可以方便的使用正则验证
	private String email;//定义email属性
	private Map<String, String> errors = null;//声明一个保存全部错误信息的Map集合
	public Register() {//在构造方法中初始化属性
		this.name = "";//初始化name属性
		this.email = "";//初始化email属性
		this.age = "";//初始化age属性
		this.errors = new HashMap<String, String>();//实例化map对象保存错误信息
	}
	public boolean isValidate() {
		//数据验证操作
		boolean falg = true;
		if(!this.name.matches("\\w{6,15}")) {//验证name的内容是否合法
			falg = false;//修改标志位
			this.name = "";//将不合法的内容清除
			errors.put("errname", "用户名是6-15位的字母或数字");//保存错误信息
		}
		if(!this.email.matches("\\w+@\\w+\\.\\w+\\.?\\w*")) {//验证email是否合法
			falg = false;//修改标志位
			this.email = "";//将不和发的内容清除
			errors.put("erremail", "输入的email地址不合法");//保存错误信息
		}
		if(!this.age.matches("\\d+")) {//验证age是否合法
			falg = false;//修改标志位
			this.age = "";//将不合法的内容清除
			errors.put("errage", "年龄只能是数字");//保存错误信息
		}
		return falg;//返回标志位
	}
	public String getErrorMsg(String key) {
		//取出对应的错误信息
		String value = this.errors.get(key);//从map中根据key取出对应的value
		return value == null ? "" : value;//返回value对应的内容
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
