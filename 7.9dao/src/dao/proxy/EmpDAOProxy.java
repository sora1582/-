package dao.proxy;

import java.util.List;

import dao.IEmpDAO;
import dao.impl.EmpDAOImpl;
import dbc.DatabaseConnection;
import vo.Emp;

public class EmpDAOProxy implements IEmpDAO {
	private DatabaseConnection dbc = null;//定义数据库连接类
	private IEmpDAO dao = null;//声明DAO对象
	
	public void EmpDAOProxy() throws Exception{//在构造方法中实例化连接，同时实例化dao对象
		this.dbc = new DatabaseConnection();//连接数据库
		this.dao = new EmpDAOImpl(this.dbc.getConnection());//实例化真实主题类
	}
	
	public boolean doCreate(Emp emp) throws Exception{
		boolean flag = false;//定义标志位
		try {
			if(this.dao.findById(emp.getEmpno()) == null) {//如果要插入的雇员编号不存在
				flag = this.dao.doCreate(emp);//调用真实主题操作
			}
		}catch(Exception e) {
			throw e;//有异常交给被调用处处理
		}finally {
			this.dbc.close();//关闭数据库连接
		}
		return flag;
	}
	
	public List<Emp> findAll(String keyWord) throws Exception{
		List<Emp> all = null;//定义返回的集合
		try {
			all = this.dao.findAll(keyWord);//调用真实主题
		}catch(Exception e) {
			throw e;//有异常交给被调用处处理
		}finally {
			this.dbc.close();//关闭数据库连接
		}
		return all;
	}
	
	public Emp findById(int empno) throws Exception{
		Emp emp = null;//定义Emp对象
		try {
			emp = this.dao.findById(empno);
		}catch(Exception e) {
			throw e;//有异常交给被调用处处理
		}finally {
			this.dbc.close();//关闭数据库连接
		}
		return emp;
	}
}
