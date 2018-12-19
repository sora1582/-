package dao;//������dao����
import java.util.List;
import vo.Emp;

public interface IEmpDAO {	//����dao������׼
	
	/**
	 * ���ݵ����Ӳ�����һ����doXxx��������ʽ
	 * @param emp Ҫ���ӵ����ݶ���
	 * @return ʱ�����ӳɹ��ı��
	 * @throws Exception ���쳣���������ô�����
	 */
	public boolean doCreate(Emp emp) throws Exception;
	
	/**
	 * ��ѯȫ�������ݣ�һ����findXxx�ķ�ʽ����
	 * @param keyWord ��ѯ�ؼ���
	 * @return ����ȫ���Ĳ�ѯ�����ÿһ��Emp�����ʾ���һ�м�¼
	 * @throws Exception ���쳣���������ô�����
	 */
	public List<Emp> findAll(String keyWord) throws Exception;
	
	/**
	 * ���ݹ�Ա��Ų�ѯ��Ա��Ϣ
	 * @param empno ��Ա���
	 * @return ��Ա��vo����
	 * @throws Exception ���쳣���������ô���
	 */
	public Emp findById(int empno) throws Exception;
}
