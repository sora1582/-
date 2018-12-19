package demo;

import java.util.Map;
import java.util.HashMap;

public class Register {
	//������������ύ��Ϣ����֤
	private String name;//����name����
	private String age;//����age���ԣ�����λstring���Է����ʹ��������֤
	private String email;//����email����
	private Map<String, String> errors = null;//����һ������ȫ��������Ϣ��Map����
	public Register() {//�ڹ��췽���г�ʼ������
		this.name = "";//��ʼ��name����
		this.email = "";//��ʼ��email����
		this.age = "";//��ʼ��age����
		this.errors = new HashMap<String, String>();//ʵ����map���󱣴������Ϣ
	}
	public boolean isValidate() {
		//������֤����
		boolean falg = true;
		if(!this.name.matches("\\w{6,15}")) {//��֤name�������Ƿ�Ϸ�
			falg = false;//�޸ı�־λ
			this.name = "";//�����Ϸ����������
			errors.put("errname", "�û�����6-15λ����ĸ������");//���������Ϣ
		}
		if(!this.email.matches("\\w+@\\w+\\.\\w+\\.?\\w*")) {//��֤email�Ƿ�Ϸ�
			falg = false;//�޸ı�־λ
			this.email = "";//�����ͷ����������
			errors.put("erremail", "�����email��ַ���Ϸ�");//���������Ϣ
		}
		if(!this.age.matches("\\d+")) {//��֤age�Ƿ�Ϸ�
			falg = false;//�޸ı�־λ
			this.age = "";//�����Ϸ����������
			errors.put("errage", "����ֻ��������");//���������Ϣ
		}
		return falg;//���ر�־λ
	}
	public String getErrorMsg(String key) {
		//ȡ����Ӧ�Ĵ�����Ϣ
		String value = this.errors.get(key);//��map�и���keyȡ����Ӧ��value
		return value == null ? "" : value;//����value��Ӧ������
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
