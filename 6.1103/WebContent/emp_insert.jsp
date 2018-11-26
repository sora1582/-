<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//乱码解决
	request.setCharacterEncoding("GBK");
%>
<script type="text/javascript">
	function changeColor(obj, color)
	{
		obj.color = color;
	}
</script>
<script type="text/javascript" src = "js/emp_validate.js"></script>
<script type="text/javascript" src = "js/data.js"></script>
<center>
	<form action = "emp_insert_do.jsp"  method = "post" onSubmit = "return validate(this)">
		<table border = "1" width = "100%" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2">
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td colspan = "3">
					<h1>增加新雇员</h1>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">雇员编号:</font>
				</td>
				<td>
					<input type = "text" name = "empno" size = "4" maxlength = "4" onBlur = "validateEmpno(this.value)">
				</td>
				<td>
					<span id = "empno_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">雇员姓名:</font>
				</td>
				<td>
					<input type = "text" name = "ename" onBlur = "validateEmpno(this.value)">
				</td>
				<td>
					<span id = "ename_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">雇员工作:</font>
				</td>
				<td>
					<input type = "text" name = "job" onBlur = "validateEmpno(this.value)">
				</td>
				<td>
					<span id = "job_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">雇佣日期:</font>
				</td>
				<td>
					<input type = "text" name = "hiredate" onClick = "popUpCalendar(this, this, 'yyyy-mm-dd')" size = "15" maxlength = "15" readonly = "true" onBlur = "validateHiedate(this.value)">
				</td>
				<td>
					<span id = "hiredate_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">基本工资:</font>
				</td>
				<td>
					<input type = "text" name = "sal" onBlur = "validateHiedate(this.value)">
				</td>
				<td>
					<span id = "sal_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColoe(this, 'F2F2F2')">
				<td>
					<font size = "2">雇佣奖金:</font>
				</td>
				<td>
					<input type = "text" name = "comm" onBlur = "validateHiedate(this.value)">
				</td>
				<td>
					<span id = "comm_msg">
						<font color = "RED">
						*
						</font>
					</span>
				</td>
			</tr>
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
				<td colspan = "3">
					<input type = "hidden" name = "cp" value = "<%=request.getParameter("cp") %>">
					<input type = "hidden" name = "ls" value = "<%= request.getParameter("ls") %>">
					<input type = "submit" value = "注册">
					<input type= "reset" value = "重置">
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>