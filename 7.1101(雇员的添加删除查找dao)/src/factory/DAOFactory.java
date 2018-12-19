package factory;

import dao.IEmpDAO;
import dao.proxy.EmpDAOProxy;

public class DAOFactory {
	public static IEmpDAO getIEmpDAOInstance() {
		return new EmpDAOProxy();//取得代理类的实例
	}
}
