package dao.proxy;

import java.util.List;

import dao.IEmpDAO;
import dao.impl.EmpDAOImpl;
import dbc.DatabaseConnection;
import vo.Emp;

public class EmpDAOProxy implements IEmpDAO{
	/*代理类的实现类，负责数据库的打开和关闭*/
	private DatabaseConnection dbc = null;
	private IEmpDAO dao = null;
	private long count = 0;
	
	public EmpDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new EmpDAOImpl(this.dbc.getConnection());
	}

	@Override
	public boolean doCreate(Emp vo) throws Exception {
		boolean flag = false;
		try {
			if(this.dao.findById(vo.getEmpno()) == null) {
				//现在没有查到雇员信息
				flag = this.dao.doCreate(vo);
			}
		}catch(Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean doUpdate(Emp vo) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doUpdate(vo);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doRemove(id);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public Emp findById(Integer id) throws Exception {
		Emp emp = null;
		try {
			emp = this.dao.findById(id);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return emp;
	}

	@Override
	public List<Emp> findAll(String KeyWord) throws Exception {
		List<Emp> all = null;
		try {
			all = this.dao.findAll(KeyWord);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return all;
	}

	@Override
	public List<Emp> findAll(String KeyWord, int currentPage, int lineSize) throws Exception {
		List<Emp> all = null;
		try {
			all = this.dao.findAll(KeyWord, currentPage,lineSize);
			this.count = this.dao.getAllCount(KeyWord);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
		return all;
	}

	@Override
	public long getAllCount(String KeyWord) throws Exception {
		return this.count;
	}
	

}
