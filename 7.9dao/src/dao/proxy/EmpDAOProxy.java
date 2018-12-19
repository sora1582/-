package dao.proxy;

import java.util.List;

import dao.IEmpDAO;
import dao.impl.EmpDAOImpl;
import dbc.DatabaseConnection;
import vo.Emp;

public class EmpDAOProxy implements IEmpDAO {
	private DatabaseConnection dbc = null;//�������ݿ�������
	private IEmpDAO dao = null;//����DAO����
	
	public void EmpDAOProxy() throws Exception{//�ڹ��췽����ʵ�������ӣ�ͬʱʵ����dao����
		this.dbc = new DatabaseConnection();//�������ݿ�
		this.dao = new EmpDAOImpl(this.dbc.getConnection());//ʵ������ʵ������
	}
	
	public boolean doCreate(Emp emp) throws Exception{
		boolean flag = false;//�����־λ
		try {
			if(this.dao.findById(emp.getEmpno()) == null) {//���Ҫ����Ĺ�Ա��Ų�����
				flag = this.dao.doCreate(emp);//������ʵ�������
			}
		}catch(Exception e) {
			throw e;//���쳣���������ô�����
		}finally {
			this.dbc.close();//�ر����ݿ�����
		}
		return flag;
	}
	
	public List<Emp> findAll(String keyWord) throws Exception{
		List<Emp> all = null;//���巵�صļ���
		try {
			all = this.dao.findAll(keyWord);//������ʵ����
		}catch(Exception e) {
			throw e;//���쳣���������ô�����
		}finally {
			this.dbc.close();//�ر����ݿ�����
		}
		return all;
	}
	
	public Emp findById(int empno) throws Exception{
		Emp emp = null;//����Emp����
		try {
			emp = this.dao.findById(empno);
		}catch(Exception e) {
			throw e;//���쳣���������ô�����
		}finally {
			this.dbc.close();//�ر����ݿ�����
		}
		return emp;
	}
}
