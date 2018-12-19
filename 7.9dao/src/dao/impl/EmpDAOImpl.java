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
	
	private Connection conn = null;//���ݿ����Ӷ���
	private PreparedStatement pstmt = null;//���ݿ��������
	public EmpDAOImpl(Connection conn) {//ͨ�����췽��ȡ�����ݿ�����
		this.conn = conn;//ȡ�����ݿ�����
	}
	
	
	@Override
	public boolean doCreate(Emp emp) throws Exception {
		boolean falg = false;//�����־λ
		String sql = "INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);//ʵ����PreparedStatement����
		this.pstmt.setInt(1, emp.getEmpno());//����empno
		this.pstmt.setString(2, emp.getEname());//����ename
		this.pstmt.setString(3, emp.getJob());//����job
		this.pstmt.setDate(4, new java.sql.Date(emp.getHiredate().getTime()));//����hiredate
		this.pstmt.setFloat(5, emp.getSal());//����sal
		if(this.pstmt.executeUpdate() > 0) {//���¼�¼����������0
			falg = true;//�޸ı�־λ
		}
		this.pstmt.close();//�ر�PreparedStatement����
		return falg;
	}

	@Override
	public List<Emp> findAll(String keyWord) throws Exception {
		List<Emp> all = new ArrayList<Emp>();//���弯�ϣ�����ȫ������
		String sql = "SELECT empno, job, hiredate, sal FROM emp WHERE ename LIKE ? OR job LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);//ʵ����PreparedStement����
		this.pstmt.setString(1, "%" + keyWord + "%");//���ò�ѯ�ؼ���
		this.pstmt.setString(2, "%" + keyWord + "%");//���ò�ѯ�ؼ���
		ResultSet rs = this.pstmt.executeQuery();//ִ�в�ѯ����
		Emp emp = null;//����Emp����
		while(rs.next()) {//����ȡ��ÿһ������
			emp = new Emp();//ʵ�����µ�Emp����
			emp.setEmpno(rs.getInt(1));//����empno������
			emp.setEname(rs.getString(2));//����ename������
			emp.setJob(rs.getString(3));//����job������
			emp.setHiredate(rs.getDate(4));//����hiredate������
			emp.setSal(rs.getFloat(5));//����sal������
			all.add(emp);//�򼯺������Ӷ���
		}
		this.pstmt.close();//�ر�PreparedStatement
		return all;//����ȫ�����
	}

	@Override
	public Emp findById(int empno) throws Exception {
		Emp emp = null;//����Emp����
		String sql = "SELECT empno, ename, job, hiredate, sal FROM emp WHERE empno = ?";
		this.pstmt = this.conn.prepareStatement(sql);//ʵ����PreparedStatement����
		this.pstmt.setInt(1, empno);//���ù�Ա���
		ResultSet rs = this.pstmt.executeQuery();//ִ�в�ѯ����
		if(rs.next()) {//���Բ�ѯ�����
			emp = new Emp();//ʵ�����µ�Emp����
			emp.setEmpno(rs.getInt(1));//����empno������
			emp.setEname(rs.getString(2));//����ename������
			emp.setJob(rs.getString(3));//����job������
			emp.setHiredate(rs.getDate(4));//����hiredate������
			emp.setSal(rs.getFloat(5));//����sal������
		}
		this.pstmt.close();//�ر�PreparedStatement����
		return emp;//�����ѯ��������򷵻�null,Ĭ��ֵλnull
	}

}
