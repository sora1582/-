<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type = "test/css">
	.STYLE6{font-size : 12px}
	.STYLE10{font-size : 14px; font-weight : bold;}
</style>
</head>
	<script language = "javascript">
		function changeColor(obj, color){
			obj.bgColor = color;
		}
	</script>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!
	public static final String URL = "emp_list.jsp";
%>
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
	int currentPage = 1;//当前所在页，默认1页
	int lineSize = 3;//每次显示的记录数
	int allRecorders = 0;//表示全部的记录数
	String keyWord = request.getParameter("kw");//接收查询关键字
	
%>
<%
	try{
		currentPage = Integer.parseInt(request.getParameter("cp"));
	}catch(Exception e){}
	try{
		lineSize = Integer.parseInt(request.getParameter("ls"));
	}catch(Exception e){}
	if(keyWord == null){
		keyWord = "";//如果模糊查询没有关键字，则表示查询全部
	}
%>
<%
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = "SELECT COUNT(empno) FROM emp " + " WHERE empno LIKE ? OR ename LIKE ? OR job LIKE ? OR TO_CHAR(hiredate,'yyyy-mm-dd') LIKE ? " + " OR sal LIKE ? OR comm LIKE ? " ;
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%" + keyWord + "%");
	pstmt.setString(2, "%" + keyWord + "%");
	pstmt.setString(3, "%" + keyWord + "%");
	pstmt.setString(4, "%" + keyWord + "%");
	pstmt.setString(5, "%" + keyWord + "%");
	pstmt.setString(6, "%" + keyWord + "%");
	rs = pstmt.executeQuery();
	if(rs.next()){//取得全部的记录数
		allRecorders = rs.getInt(1);
	}
%>

<center>
	<h1>雇员列表</h1>
	<h3><a href = "emp_insert.jsp?cp=<%=currentPage%>&ls=<%=lineSize%>">增加新雇员</a></h3>
	
	
	<jsp:include page = "split_page_plugin.jsp">
		<jsp:param name = "allRecorders" value = "<%= allRecorders %>"/>
		<jsp:param name = "url" value = "<%= URL %>"/>
	</jsp:include>
	
	<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td align ="center" valign = "middle"><span class = "STYLE10">编号</span></td>
			<td align ="center" valign = "middle"><span class = "STYLE10">姓名</span></td>
			<td align ="center" valign = "middle"><span class = "STYLE10">职位</span></td>
			<td align ="center" valign = "middle"><span class = "STYLE10">雇佣日期</span></td>
			<td align ="center" valign = "middle"><span class = "STYLE10">工资</span></td>
			<td align ="center" valign = "middle"><span class = "STYLE10">奖金</span></td>
			<td align ="center" valign = "middle" colspan = "2"><span class = "STYLE10">操作</span></td>
		</tr>
<%
sql = 	"SELECT * FROM (	" + 
		" SELECT empno,ename,job,hiredate,sal,comm,ROWNUM rn " +
		" FROM emp WHERE (empno LIKE ? OR ename LIKE ? OR job LIKE ? OR TO_CHAR(hiredate,'yyyy-mm-dd') LIKE ? OR sal LIKE ? OR comm LIKE ?) AND " + 
		" ROWNUM<=? ORDER BY empno) temp " + 
		" WHERE temp.rn>? " ;	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%" + keyWord + "%");
	pstmt.setString(2, "%" + keyWord + "%");
	pstmt.setString(3, "%" + keyWord + "%");
	pstmt.setString(4, "%" + keyWord + "%");
	pstmt.setString(5, "%" + keyWord + "%");
	pstmt.setString(6, "%" + keyWord + "%");
	pstmt.setInt(7, currentPage * lineSize);
	pstmt.setInt(8, (currentPage - 1) * lineSize);
	rs = pstmt.executeQuery();
%>
<%
	while(rs.next()){
		int empno = rs.getInt(1);
		String ename = rs.getString(2);
		String job = rs.getString(3);
		Date hiredate = rs.getDate(4);
		double sal = rs.getDouble(5);
		double comm = rs.getDouble(6);
	
%>
	<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= empno %></span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= ename %></span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= job %></span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= hiredate %></span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= sal %></span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6"><%= comm %></span>
		</td>
		<td align = "center" valign = "middle"><span class = "STYLE6"><a href = "emp_update.jsp?empno=<%=empno%>&cp=<%=currentPage%>&ls=<%=lineSize%>">修改</a></span></td>
		<td align = "center" valign = "middle"><span class = "STYLE6"><a href = "emp_delete_do.jsp?empno=<%=empno%>&cp=<%=currentPage%>&ls=<%=lineSize%>">删除</a></span></td>
	</tr>
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