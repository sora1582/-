<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	// 要购买的商品编号
	int pid = Integer.parseInt(request.getParameter("pid")) ;
	Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// 取得全部已经购买的商品
	// 但如果是第一次购买的话，肯定取得不到
	if(cars == null){	// 现在没有购买任何的商品
		cars = new HashMap<Integer,Integer>() ;	// 实例化一个新的Map对象
	}
	if(cars.get(pid) == null){	// 还没有购买此商品
		cars.put(pid,1) ;	// 此商品购买了一个
	} else {	// 现在已经购买了
		int val = cars.get(pid) ;	// 取出原本的数量
		val++ ;	// 增加
		cars.put(pid,val) ;	// 覆盖已有的内容
	}
	session.setAttribute("allpid",cars) ;	// 重新保存更改后的数据
%>
<jsp:forward page="product_cars.jsp"/>
</body>
</html>