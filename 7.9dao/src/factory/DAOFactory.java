package factory;
import dao.IEmpDAO;
import dao.proxy.EmpDAOProxy;
public class DAOFactory {
	public static IEmpDAO getIEmpDAOInstance() throws Exception{//ȡ��DAO�ӿ�ʵ��
		return new EmpDAOProxy();//ȡ�ô������ʵ��
	}
}
