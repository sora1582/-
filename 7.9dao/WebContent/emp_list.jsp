<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "factory.*, vo.*" %>
<%@ page import = "java.util.*" %>
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
	try{
		String keyWord = request.getParameter("kw");//接收查询关键字
		if(keyWord == null){//判断是否有传递的参数
			keyWord = "";
		}
		List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll(keyWord);//取得全部记录
		Iterator<Emp> iter = all.iterator();//实例化Iterator对象
%>
<center>
<form action = "emp_list.jsp" method = "post">
	请输入查询关键字:<input type = "text" name = "kw">
	<input type = "submit" value = "查询">
</form>
<table border = "1" width = "80%"><!-- 输出表格，边框为1，宽度为页面的80% -->
	<tr><!-- 输出表格显示的行 -->
		<td>雇员编号</td>
		<td>雇员姓名</td>
		<td>雇员工作</td>
		<td>雇员工资</td>
		<td>雇佣日期</td>
	</tr>
<%
	while(iter.hasNext()){
		Emp emp = iter.next();//取出每一个Emp对象			
%>
	<tr>
		<td><%= emp.getEmpno() %></td>
		<td><%= emp.getEname() %></td>
		<td><%= emp.getJob() %></td>
		<td><%= emp.getSal() %></td>
		<td><%= emp.getHiredate() %></td>
	</tr>
<%
	}
%>
</table>
</center>
<%
	}catch(Exception e){
		e.printStackTrace();//在tomcat后台打印
	}
%>
</body>
</html>