<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>www.mldnjava.cn��MLDN�߶�Java��ѵ</title></head>
	<style type="text/css">
	<!--
	.STYLE6 {font-size: 12px}
	.STYLE10 {font-size: 14px; font-weight: bold; }
	-->
	</style>
	<script language="javascript">
			function changeColor(obj,color){
				obj.bgColor = color ;
			}
		</script>
<body>
<jsp:include page="login_filter.jsp"/>
<%
	request.setCharacterEncoding("GBK") ;
%>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver" ;
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:orcl" ;
	public static final String DBUSER = "system" ;
	public static final String DBPASSWORD = "123" ;
%>
<%
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs = null ;
%>
<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "SELECT mid,name,address,telephone,zipcode FROM member WHERE mid=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,(String)session.getAttribute("id")) ;
	rs = pstmt.executeQuery() ;
%>
<%
	if(rs.next()){	// ���ҵ�����Ϣ
		String mid = rs.getString(1) ;
		String name = rs.getString(2) ;
		String address = rs.getString(3) ;
		String telephone = rs.getString(4) ;
		String zipcode = rs.getString(5) ;
%>
<form action="member_update_do.jsp" method="post">
	<table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="F2F2F2">
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td colspan="2">
			�޸��û���Ϣ
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">�û���ţ�</span></td>
		<td><font size="2"><%=mid%>
		</font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">��ʵ������</span></td>
		<td><font size="2"><input type="text" name="name" value="<%=name%>" size="50"></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">��ϵ�绰��</span></td>
		<td><font size="2"><input type="text" name="telephone" value="<%=telephone%>" size="50"></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</span></td>
		<td><font size="2"><input type="text" name="address" value="<%=address%>" size="50"></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">�������룺</span></td>
		<td><font size="2"><input type="text" name="zipcode" value="<%=zipcode%>" size="50"></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td colspan="2"><span class="STYLE10">
			<input type="hidden" name="mid" value="<%=mid%>">
			<input type="submit" value="�޸�">
			<input type="reset" value="����">
		</span></td>
	</tr>
	</table>
</form>
<%
	}
%>
<%
	conn.close() ;
%>
</body>
</html>