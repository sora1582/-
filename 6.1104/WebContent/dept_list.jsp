<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type = "text/css">
	.STYLE6{font-size:12px}
	.STYLE10{font-size:14px; font-weight:bold;}
</style>
</head>
<script type="text/javascript">
	function changeColor(obj, color){
		obj.bgColor = color;
	}
</script>
<script type = "text/javascript" src = "<%=request.getContextPath()%>/js/dept_validate.js">
</script>
<body>
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
%>

<center>
	<h1>部门列表</h1>
	<form action="dept_insert_do.jsp" method = "post" onsubmit = "return validate(this)">
		<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
			<tr onMouseOver = "changeColor(this,'white')" onMouseOut = "changeColor(this,'F2F2F2')">
				<td align = "center" valign = "middle">
					<span class = "STYLE10">部门编号</span>
				</td>
				<td align = "left" valign = "middle">
					<input type = "text" name = "deptno" size = "2" maxlength = "2" onblur = "validateDeptno(this.value)">
				</td>
				<td align = "center" valign = "middle">
					<span id = "deptno_msg">*</span>
				</td>
			</tr>
			<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"><span class="STYLE10">部门名称</span></td>
			  <td align="left" valign="middle">
			  	<input type="text" name="dname" onblur="validateDname(this.value)">
			  	</td>
				<td align="center" valign="middle"><span id="dname_msg">*</span></td>
			</TR>
			<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"><span class="STYLE10">部门位置</span></td>
			  <td align="left" valign="middle"><input type="text" name="loc"  onblur="validateLoc(this.value)"></td>
				<td align="center" valign="middle"><span id="loc_msg">*</span></td>
			</TR>
			<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle" colspan="3">
					<input type="submit" value="增加新部门">
					<input type="reset" value="重置">
				</td>
			</TR>
		</table>
	</form>
	<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
		<tr onMouseOver = "changeColor(this,'white')" onMouseOut = "changeColor(this.'F2F2F2')">
			<td align = "center" valign = "middle">
			<span class = "STYLE10">编号</span>
			</td>
			<td align = "center" valign = "middle">
			<span class = "STYLE10">名称</span>
			</td>
			<td align = "center" valign = "middle">
			<span class = "STYLE10">位置</span>
			</td>
			<td align = "center" valign = "middle">
			<span class = "STYLE10">操作</span>
			</td>	
		</tr>
<%
	String sql = "SELECT deptno, dname, loc FROM dept";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<%
	while(rs.next()){
		int deptno = rs.getInt(1);
		String dname = rs.getString(2);
		String loc = rs.getString(3);
%>
		<form action = "dept_update_do.jsp" method = "post">
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this,'F2F2F2')">
			<td align = "center" valign = "middle">
				<span class = "STYLE6"><%=deptno %></span>
			</td>
			<td align="center" valign="middle"><span class="STYLE6"><input type="text" name="dname" value="<%=dname%>"></span></td>
			<td align="center" valign="middle"><span class="STYLE6"><input type="text" name="loc" value="<%=loc%>"></span></td>
			<td align="center" valign="middle">
				<span class="STYLE6">
					<input type="hidden" name="deptno" value="<%=deptno%>">
					<input type="submit" value="修改">
				</span>
			</td>
			<td align="center" valign="middle">
				<span class="STYLE6">
					<a href="dept_delete_do.jsp?deptno=<%=deptno%>">删除</a>
				</span>
			</td>
		</tr>
		</form>
<%
	}
%>
</table>
<%
	conn.close();
%>
</center>
</body>
</html>