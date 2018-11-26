<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//要购买的商品编号
	Enumeration allpid = request.getParameterNames();//取得所有的提交数据
	Map<Integer, Integer> cars = (Map<Integer, Integer>)session.getAttribute("allpid");//取得全部已经购买的商品
	if(cars == null){
		//现在没有购买任何的商品
		cars = new HashMap<Integer, Integer>();//实例化一个map对象
		while(allpid.hasMoreElements()){
			String paramName = (String) allpid.nextElement();
			try{
				int pid = Integer.parseInt(paramName);
				int val = Integer.parseInt(request.getParameter(paramName));
				cars.put(pid, val);//重设相同的pid则表示覆盖
			}catch(Exception e){}
		}
		session.setAttribute("allpid", cars);//重新保存更改后的数据
	}
%>
<jsp:forward page = "product_cars.jsp"/>
</body>
</html>