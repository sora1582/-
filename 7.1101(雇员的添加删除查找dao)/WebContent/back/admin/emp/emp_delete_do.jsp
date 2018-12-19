<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "factory.*,java.text.*,vo.*" %>
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
	/* 取得要删除雇员的编号 */
	int empno = Integer.parseInt(request.getParameter("empno"));
%>
<%
	String msg = "雇员删除失败";
	if(DAOFactory.getIEmpDAOInstance().doRemove(empno)){
		msg = "雇员删除成功";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	window.location = "emp_list.jsp?cp=<%=request.getParameter("cp")%>&ls=<%=request.getParameter("ls")%>";
</script>
</body>
</html>