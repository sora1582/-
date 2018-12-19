<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*" %>
<%@ page import = "factory.*" %>
<%@ page import = "vo.*" %>
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
	/* 定义接收变量的参数 */
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	java.util.Date hiredate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("hiredate"));
	double sal = Double.parseDouble(request.getParameter("sal"));
	double comm = Double.parseDouble(request.getParameter("comm"));
%>
<%
	/* 给新的雇员对象赋值 ,调用后面的方法，修改信息*/
	String msg = "雇员修改失败";
	Emp emp = new Emp();
	emp.setEmpno(empno);
	emp.setEname(ename);
	emp.setJob(job);
	emp.setHiredate(hiredate);
	emp.setSal(sal);
	emp.setComm(comm);
	if(DAOFactory.getIEmpDAOInstance().doUpdate(emp)){
		msg = "雇员修改成功";
	}
%>
<script language = "javascript">
	alert("<%=msg%>");
	window.location = "emp_list.jsp?cp=<%=request.getParameter("cp")%>&ls=<%=request.getParameter("ls")%>"
</script>
</body>
</html>