<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*, factory.*, dao.*" %>
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
<script type="text/javascript">
	function changeColor(obj, color){
		obj.bgColor = color;
	}
</script>
<script language = "javascript">
	var url = "<%=request.getContextPath()%>";
</script>
<script language = "javascript" src = "<%=request.getContextPath()%>/js/emp_validate.js">
</script>
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/data.js">
</script>
<center>
<%
	int empno = 0;
	try{
		empno = Integer.parseInt(request.getParameter("empno"));
	}catch(Exception e){}
	Emp emp = DAOFactory.getIEmpDAOInstance().findById(empno);
%>
<%
	if(emp != null){
%>
<form action="emp_update_do.jsp" method="post" onSubmit="return validate(this)">
<table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="F2F2F2">
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td colspan="3">
			<h1>修改雇员信息</h1>		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">雇员编号：</font></td>
		<td><%=emp.getEmpno()%></td>
		<td><span id="empno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">雇员姓名：</font></td>
		<td><input type="text" name="ename" onBlur="validateEname(this.value)" value="<%=emp.getEname()%>"></td>
		<td><span id="ename_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">雇员工作：</font></td>
		<td><input type="text" name="job" onBlur="validateJob(this.value)" value="<%=emp.getJob()%>"></td>
		<td><span id="job_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">雇佣日期：</font></td>
		<td><INPUT TYPE="text" NAME="hiredate" onclick='popUpCalendar(this, this, "yyyy-mm-dd")' size="15" maxlength="15" readonly="true" onBlur="validateHiredate(this.value)"  value="<%=emp.getHiredate()%>"></td>
		<td><span id="hiredate_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">基本工资：</font></td>
		<td><input type="text" name="sal" onBlur="validateSal(this.value)"  value="<%=emp.getSal()%>"></td>
		<td><span id="sal_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">雇佣奖金：</font></td>
		<td><input type="text" name="comm" onBlur="validateComm(this.value)"  value="<%=emp.getComm()%>"></td>
		<td><span id="comm_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td colspan="3">
			<input type="hidden" name="empno" value="<%=emp.getEmpno()%>">
			<input type="hidden" name="cp" value="<%=request.getParameter("cp")%>">
			<input type="hidden" name="ls" value="<%=request.getParameter("ls")%>">
			<input type="submit" value="修改">
			<input type="reset" value="重置">		</td>
	</tr>
</table>
</form>
<%
	}else{
%>
<script type="text/javascript">
	alert("没有此雇员的信息");
	window.location = "emp_list.jsp ? cp = <%= request.getParameter("cp") %> & ls = <%=request.getParameter("ls")%>";
</script>
<%
	}
%>
</center>
</body>
</html>