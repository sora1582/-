package vo;	//������vo����
import java.util.Date;

public class Emp {
	private int empno;//�����Ա��ţ���emp���е�epmono���Ͷ�Ӧ
	private String ename;//�����Ա��������emp���е�ename���Ͷ�Ӧ
	private String job;//�����Աְλ����emp���е�job���Ͷ�Ӧ
	private Date hiredate;//�����Ӷ���ڣ���emp���е�hiredate���Ͷ�Ӧ
	private float sal;//����������ʣ���emp���е�sal���Ͷ�Ӧ
	
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
