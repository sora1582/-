<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head><title>www.mldnjava.cn��MLDN�߶�Java��ѵ</title></head>
<body>
<%	// Ҫ�������Ʒ���
	int pid = Integer.parseInt(request.getParameter("pid")) ;
	Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// ȡ��ȫ���Ѿ��������Ʒ
	// ������ǵ�һ�ι���Ļ����϶�ȡ�ò���
	if(cars == null){	// ����û�й����κε���Ʒ
		cars = new HashMap<Integer,Integer>() ;	// ʵ����һ���µ�Map����
	}
	if(cars.get(pid) == null){	// ��û�й������Ʒ
		cars.put(pid,1) ;	// ����Ʒ������һ��
	} else {	// �����Ѿ�������
		int val = cars.get(pid) ;	// ȡ��ԭ��������
		val++ ;	// ����
		cars.put(pid,val) ;	// �������е�����
	}
	session.setAttribute("allpid",cars) ;	// ���±�����ĺ������
%>
<jsp:forward page="product_cars.jsp"/>
</body>
</html>