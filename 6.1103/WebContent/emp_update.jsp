<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<script language = "javascript">
	function changeColor(obj, color){
		obj.Color = color;
	}
</script>
<script type="text/javascript" src = "js/emp_validate.js"></script>
<script type="text/javascript" src = "js/data.js"></script>
<center>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521/orcl";
	public static final String DBUSER = "system";
	public static final String DBPASSWORD = "123";
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = "SELECT empno, ename, job, hiredate, sal, comm FROM emp WHERE empno = ?";
	int empno = 0;
	try{
		empno = Integer.parseInt(request.getParameter("empno"));
	}catch(Exception e){}
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, empno);
		rs = pstmt.executeQuery();
	
%>
<%
	if(rs.next()){
		empno = rs.getInt(1);
		String ename = rs.getString(2);
		String job = rs.getString(3);
		Date hiredate = rs.getDate(4);
		double sal = rs.getDouble(5);
		double comm = rs.getDouble(6);
	
%>
<form action = "emp_update_do.jsp" method = "post" onSubmit = "return validate(this)">
	<table border = "1" width = "100%" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2">
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td colspan = "3">
				<h1>修改雇员信息</h1>
			</td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">雇员编号:</font></td>
			<td><%= empno %></td>
			<td><span id = "empno_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">雇员姓名:</font></td>
			<td><input type = "text" name = "ename" onBlur = "validateEname(this.value)" value = "<%= ename%>"></td>
			<td><span id = "ename_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">雇员工作:</font></td>
			<td><input type = "text" name = "job" onBlur = "validateJob(this.value)" value = "<%=job%>"></td>
			<td><span id = "job_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">雇佣日期:</font></td>
			<td><input type = "text" name = "hiredate" onclick = 'popUpCalendar(this, this, "yyyy-mm-dd")' size = "15" readonly = "true" onBlur = "validateHiredate(this.value)" value = "<%= hiredate %>"></td>
			<td><span id = "hiredate_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">基本工资:</font></td>
			<td><input type = "text" name = "sal" onBlur = "validateSal(this.val)" value = "<%=sal%>"></td>
			<td><span id = "sal_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td><font size = "2">雇佣奖金:</font></td>
			<td><input type = "text" name = "comm" onBlur = "validateComm(this.value)" value = "<%= comm%>"></td>
			<td><span id = "comm_msg"><font color = "RED">*</font></span></td>
		</tr>
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td colspan = "3">
				<input type = "hidden" name = "empno" value = "<%=empno%>">
				<input type = "hidden" name = "cp" value = "<%=request.getParameter("cp")%>">
				<input type = "hidden" name = "ls" value = "<%=request.getParameter("ls")%>">
				<input type = "submit" value = "修改">
				<input type = "reset" value = "重置">
			</td>
		</tr>
	</table>
</form>
<%
	}else{
%>
		<script language = "javascript">
			alert("没有此雇员的信息");
			window.location = "emp_list.jsp?cp=<%=request.getParameter("cp")%>&ls=<%=request.getParameter("ls")%>";
		</script>
<%
	}
	conn.close();//连接必须关闭
%>
</center>
</body>
</html>