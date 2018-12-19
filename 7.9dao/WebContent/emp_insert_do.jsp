<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "factory.*, vo.*" %>
<%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<body>
<%
	Emp emp = new Emp();//实例化Emp对象
	emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
	emp.setEname(request.getParameter("ename"));
	emp.setJob(request.getParameter("job"));
	emp.setHiredate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("hiredate")));//字符串变为date型数据
	emp.setSal(Float.parseFloat(request.getParameter("sal")));
	
	try{
		if(DAOFactory.getIEmpDAOInstance().doCreate(emp)){//执行插入操作
%>
	<h3>雇员信息添加成功</h3>
<%
		}else{
%>
	<h3>雇员信息添加失败</h3>
<%
		}
	}catch(Exception e){
		e.printStackTrace();//再tomcat后台打印
	}
%>
</body>
</html>