package dao.test;

import factory.DAOFactory;
import vo.Emp;

public class TestDAOInsert {
	public static void main(String[] args) throws Exception{//�����쳣�׳�
		Emp emp = null;//����Emp����
		for(int x = 0; x < 5; x++) {//ִ�в������ݵĲ���
			emp = new Emp();//ʵ�����µ�Emp����
			emp.setEmpno(1000 + x);//���ù�Ա���
			emp.setEname("���˻� - " + x);//���ù�Ա����
			emp.setJob("����Ա - " + x);//���ù�Ա����
			emp.setHiredate(new java.util.Date());//���ù�Ӷ����Ϊ����
			emp.setSal(500 * x);//���ù���
			DAOFactory.getIEmpDAOInstance().doCreate(emp);//ִ�����ݿ�������
		}
	}
}
