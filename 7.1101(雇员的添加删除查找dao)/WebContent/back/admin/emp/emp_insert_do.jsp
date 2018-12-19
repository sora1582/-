<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*" %>
<%@ page import = "vo.*, factory.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	/* 取得刚传来的值，放在声明的变量里面 */
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	java.util.Date hiredate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("hiredate"));
	double sal = Double.parseDouble(request.getParameter("sal"));
	double comm = Double.parseDouble(request.getParameter("comm"));
%>
<%
	/* 创建雇员对象，把刚刚存下来的值添加 */
	String msg = "雇员增加失败";
	Emp emp = new Emp();
	emp.setEmpno(empno);
	emp.setEname(ename);
	emp.setJob(job);
	emp.setHiredate(hiredate);
	emp.setSal(sal);
	emp.setComm(comm);
	/* 调用后面的类进行添加 */
	if(DAOFactory.getIEmpDAOInstance().doCreate(emp)){
		msg = "雇员增加成功";
	}
%>
<script language = "javascript">
	alert("<%=msg%>");
	window.location = "emp_insert.jsp";/* 获取当前页面的URL，重定向到指定的页面 */
</script>
</body>
</html>