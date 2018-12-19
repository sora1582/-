package factory;
import dao.IEmpDAO;
import dao.proxy.EmpDAOProxy;
public class DAOFactory {
	public static IEmpDAO getIEmpDAOInstance() throws Exception{//取得DAO接口实例
		return new EmpDAOProxy();//取得代理类的实例
	}
}
