<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head><title>www.mldnjava.cn，MLDN高端Java培训</title></head>
<body>
<jsp:include page="login_filter.jsp"/>
<%	// 要购买的商品编号
	Enumeration allpid = request.getParameterNames() ;	// 取得所有的提交数据
	Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// 取得全部已经购买的商品
	if(cars == null){	// 现在没有购买任何的商品
		cars = new HashMap<Integer,Integer>() ;	// 实例化一个新的Map对象
	}
	while(allpid.hasMoreElements()){
		String paramName = (String) allpid.nextElement();
		try{
			int pid = Integer.parseInt(paramName) ;
			int val = Integer.parseInt(request.getParameter(paramName)) ;
			cars.put(pid,val) ;	// 重新设置相同的PID，则表示覆盖
		}catch(Exception e){}
	}
	session.setAttribute("allpid",cars) ;	// 重新保存更改后的数据
%>
<jsp:forward page="product_cars.jsp"/>
</body>
</html>