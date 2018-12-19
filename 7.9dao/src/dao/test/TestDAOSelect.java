package dao.test;

import java.util.Iterator;
import java.util.List;

import factory.DAOFactory;
import vo.Emp;

public class TestDAOSelect {
	public static void main(String[] args) throws Exception{//所有异常抛出
		List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll("");//查询全部数据
		Iterator<Emp> iter = all.iterator();//迭代输出
		while(iter.hasNext()) {//循环输出
			Emp emp = iter.next();//取出每一个对象
			System.out.println(emp.getEmpno() + "," + emp.getEname() + "-->" + emp.getEname());//打印信息
		}
	}
}
