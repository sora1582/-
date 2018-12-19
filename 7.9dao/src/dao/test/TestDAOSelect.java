package dao.test;

import java.util.Iterator;
import java.util.List;

import factory.DAOFactory;
import vo.Emp;

public class TestDAOSelect {
	public static void main(String[] args) throws Exception{//�����쳣�׳�
		List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll("");//��ѯȫ������
		Iterator<Emp> iter = all.iterator();//�������
		while(iter.hasNext()) {//ѭ�����
			Emp emp = iter.next();//ȡ��ÿһ������
			System.out.println(emp.getEmpno() + "," + emp.getEname() + "-->" + emp.getEname());//��ӡ��Ϣ
		}
	}
}
