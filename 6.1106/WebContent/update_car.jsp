<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head><title>www.mldnjava.cn��MLDN�߶�Java��ѵ</title></head>
<body>
<jsp:include page="login_filter.jsp"/>
<%	// Ҫ�������Ʒ���
	Enumeration allpid = request.getParameterNames() ;	// ȡ�����е��ύ����
	Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// ȡ��ȫ���Ѿ��������Ʒ
	if(cars == null){	// ����û�й����κε���Ʒ
		cars = new HashMap<Integer,Integer>() ;	// ʵ����һ���µ�Map����
	}
	while(allpid.hasMoreElements()){
		String paramName = (String) allpid.nextElement();
		try{
			int pid = Integer.parseInt(paramName) ;
			int val = Integer.parseInt(request.getParameter(paramName)) ;
			cars.put(pid,val) ;	// ����������ͬ��PID�����ʾ����
		}catch(Exception e){}
	}
	session.setAttribute("allpid",cars) ;	// ���±�����ĺ������
%>
<jsp:forward page="product_cars.jsp"/>
</body>
</html>