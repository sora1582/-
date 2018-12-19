package vo;	//保存在vo包中
import java.util.Date;

public class Emp {
	private int empno;//定义雇员编号，与emp表中的epmono类型对应
	private String ename;//定义雇员姓名，与emp表中的ename类型对应
	private String job;//定义雇员职位，与emp表中的job类型对应
	private Date hiredate;//定义雇佣日期，与emp表中的hiredate类型对应
	private float sal;//定义基本工资，与emp表中的sal类型对应
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public float getSal() {
		return sal;
	}
	public void setSal(float sal) {
		this.sal = sal;
	}
}
