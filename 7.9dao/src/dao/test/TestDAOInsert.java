package dao.test;

import factory.DAOFactory;
import vo.Emp;

public class TestDAOInsert {
	public static void main(String[] args) throws Exception{//所有异常抛出
		Emp emp = null;//定义Emp对象
		for(int x = 0; x < 5; x++) {//执行插入数据的操作
			emp = new Emp();//实例化新的Emp对象
			emp.setEmpno(1000 + x);//设置雇员编号
			emp.setEname("李兴华 - " + x);//设置雇员姓名
			emp.setJob("程序员 - " + x);//设置雇员工作
			emp.setHiredate(new java.util.Date());//设置雇佣日期为今天
			emp.setSal(500 * x);//设置工资
			DAOFactory.getIEmpDAOInstance().doCreate(emp);//执行数据库插入操作
		}
	}
}
