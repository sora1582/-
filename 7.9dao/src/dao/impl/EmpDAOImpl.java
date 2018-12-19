package dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.RE;

import dao.IEmpDAO;
import vo.Emp;

public class EmpDAOImpl implements IEmpDAO {
	
	private Connection conn = null;//数据库连接对象
	private PreparedStatement pstmt = null;//数据库操作对象
	public EmpDAOImpl(Connection conn) {//通过构造方法取得数据库连接
		this.conn = conn;//取得数据库连接
	}
	
	
	@Override
	public boolean doCreate(Emp emp) throws Exception {
		boolean falg = false;//定义标志位
		String sql = "INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);//实例化PreparedStatement对象
		this.pstmt.setInt(1, emp.getEmpno());//设置empno
		this.pstmt.setString(2, emp.getEname());//设置ename
		this.pstmt.setString(3, emp.getJob());//设置job
		this.pstmt.setDate(4, new java.sql.Date(emp.getHiredate().getTime()));//设置hiredate
		this.pstmt.setFloat(5, emp.getSal());//设置sal
		if(this.pstmt.executeUpdate() > 0) {//更新记录的行数大于0
			falg = true;//修改标志位
		}
		this.pstmt.close();//关闭PreparedStatement操作
		return falg;
	}

	@Override
	public List<Emp> findAll(String keyWord) throws Exception {
		List<Emp> all = new ArrayList<Emp>();//定义集合，接收全部数据
		String sql = "SELECT empno, job, hiredate, sal FROM emp WHERE ename LIKE ? OR job LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);//实例化PreparedStement对象
		this.pstmt.setString(1, "%" + keyWord + "%");//设置查询关键字
		this.pstmt.setString(2, "%" + keyWord + "%");//设置查询关键字
		ResultSet rs = this.pstmt.executeQuery();//执行查询操作
		Emp emp = null;//定义Emp对象
		while(rs.next()) {//依次取出每一条数据
			emp = new Emp();//实例化新的Emp对象
			emp.setEmpno(rs.getInt(1));//设置empno的内容
			emp.setEname(rs.getString(2));//设置ename的内容
			emp.setJob(rs.getString(3));//设置job的内容
			emp.setHiredate(rs.getDate(4));//设置hiredate的内容
			emp.setSal(rs.getFloat(5));//设置sal的内容
			all.add(emp);//向集合中增加对象
		}
		this.pstmt.close();//关闭PreparedStatement
		return all;//返回全部结果
	}

	@Override
	public Emp findById(int empno) throws Exception {
		Emp emp = null;//声明Emp对象
		String sql = "SELECT empno, ename, job, hiredate, sal FROM emp WHERE empno = ?";
		this.pstmt = this.conn.prepareStatement(sql);//实例化PreparedStatement对象
		this.pstmt.setInt(1, empno);//设置雇员编号
		ResultSet rs = this.pstmt.executeQuery();//执行查询操作
		if(rs.next()) {//可以查询到结果
			emp = new Emp();//实例化新的Emp对象
			emp.setEmpno(rs.getInt(1));//设置empno的内容
			emp.setEname(rs.getString(2));//设置ename的内容
			emp.setJob(rs.getString(3));//设置job的内容
			emp.setHiredate(rs.getDate(4));//设置hiredate的内容
			emp.setSal(rs.getFloat(5));//设置sal的内容
		}
		this.pstmt.close();//关闭PreparedStatement操作
		return emp;//如果查询不到结果则返回null,默认值位null
	}

}
