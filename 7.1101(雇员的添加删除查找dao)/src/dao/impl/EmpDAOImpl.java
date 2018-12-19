package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.IEmpDAO;
import vo.Emp;

/*IEmpDAO的实现类*/
public class EmpDAOImpl implements IEmpDAO{
	private Connection conn;
	private PreparedStatement pstmt = null;
	/*构造方法取得数据库的连接*/
	public EmpDAOImpl(Connection conn) {
		this.conn = conn;
	}

	/*实现接口的方法,具体的实现*/
	@Override
	public boolean doCreate(Emp vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO emp(empno,ename,job,hiredate,sal,comm) VALUES (?,?,?,?,?,?)";		
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getEmpno());
		this.pstmt.setString(2, vo.getEname());
		this.pstmt.setString(3, vo.getJob());
		this.pstmt.setDate(4, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(5, vo.getSal());
		this.pstmt.setDouble(6, vo.getComm());
		if(this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean doUpdate(Emp vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE emp SET ename=?,job=?,hiredate=?,sal=?,comm=? WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getEname());
		this.pstmt.setString(2, vo.getJob());
		this.pstmt.setDate(3, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(4, vo.getSal());
		this.pstmt.setDouble(5, vo.getComm());
		this.pstmt.setInt(6, vo.getEmpno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM emp WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public Emp findById(Integer id) throws Exception {
		Emp emp = null;
		String sql = "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm FROM emp e"
				+ "  WHERE e.empno=? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if(rs.next()) {
			emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			
		}
		return emp;
	}

	@Override
	public List<Emp> findAll(String KeyWord) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm FROM emp e"
				+ "  WHERE e.empno LIKE ? OR e.ename LIKE ? OR TO_CHAR(e.hiredate,'yyyy-mm-dd') LIKE ? "
				+ " OR e.sal LIKE ? OR e.comm LIKE ? OR e.job LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		this.pstmt.setString(2, "%" + KeyWord + "%");
		this.pstmt.setString(3, "%" + KeyWord + "%");
		this.pstmt.setString(4, "%" + KeyWord + "%");
		this.pstmt.setString(5, "%" + KeyWord + "%");
		this.pstmt.setString(6, "%" + KeyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()) {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			all.add(emp);
		}
		return all;
	}

	@Override
	public List<Emp> findAll(String KeyWord, int currentPage, int lineSize) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT * FROM ("
				+ "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,ROWNUM rn FROM emp e"
				+ "  WHERE (e.empno LIKE ? OR e.ename LIKE ? OR TO_CHAR(e.hiredate,'yyyy-mm-dd') LIKE ? "
				+ " OR e.sal LIKE ? OR e.comm LIKE ? OR e.job LIKE ?) AND ROWNUM<=?) temp "
				+ " WHERE temp.rn>?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		this.pstmt.setString(2, "%" + KeyWord + "%");
		this.pstmt.setString(3, "%" + KeyWord + "%");
		this.pstmt.setString(4, "%" + KeyWord + "%");
		this.pstmt.setString(5, "%" + KeyWord + "%");
		this.pstmt.setString(6, "%" + KeyWord + "%");
		this.pstmt.setInt(7, currentPage * lineSize);
		this.pstmt.setInt(8, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()) {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			all.add(emp);
		}
		return all;
	}

	@Override
	public long getAllCount(String KeyWord) throws Exception {
		long count = 0;
		/*to_char(日期,"转换格式" ) 即把给定的日期按照“转换格式”转换*/
		String sql = "SELECT COUNT(e.empno) FROM emp e"
				+ "  WHERE e.empno LIKE ? OR e.ename LIKE ? OR TO_CHAR(e.hiredate,'yyyy-mm-dd') LIKE ? "
				+ " OR e.sal LIKE ? OR e.comm LIKE ? OR e.job LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		this.pstmt.setString(2, "%" + KeyWord + "%");
		this.pstmt.setString(3, "%" + KeyWord + "%");
		this.pstmt.setString(4, "%" + KeyWord + "%");
		this.pstmt.setString(5, "%" + KeyWord + "%");
		this.pstmt.setString(6, "%" + KeyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getLong(1);
		}
		return count;
	}
}
