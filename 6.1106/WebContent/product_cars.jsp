<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<html>
<head><title>www.mldnjava.cn��MLDN�߶�Java��ѵ</title>
<style type="text/css">
<!--
.STYLE6 {font-size: 12px}
.STYLE10 {font-size: 14px; font-weight: bold; }
-->
</style>
</head>
	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
		function gocheck(){
			window.location = "product_order_list.jsp" ;
		}
	</script>
<body>
<jsp:include page="login_filter.jsp"/>
<%!
	public static final String URL = "product_list.jsp" ;
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
	Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;
	if(cars != null) {
		Set<Integer> key = cars.keySet() ;	// ȡ��ȫ����key
%>
<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	StringBuffer sql = new StringBuffer() ;	// ѭ���޸����ݵ�ʱ��ʹ��StringBuffer
%>
<center>
	<h1>��Ʒ�б�</h1>
<form action="update_car.jsp" method="post">
<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE10">���</span></td>
		<td align="center" valign="middle"><span class="STYLE10">����</span></td>
		<td align="center" valign="middle"><span class="STYLE10">�۸�</span></td>
		<td align="center" valign="middle"><span class="STYLE10">����</span></td>
		<td align="center" valign="middle"><span class="STYLE10">���</span></td>
		<td align="center" valign="middle"><span class="STYLE10">����</span></td>
	</TR>
<%
	sql.append("SELECT pid,name,note,price,amount FROM product WHERE pid IN (") ;
	int count = 0 ;
	Iterator<Integer> iter = key.iterator() ;
	while(iter.hasNext()){
		count++ ;
		sql.append(iter.next()) ;
		if(count <= key.size()-1){
			sql.append(",") ;
		}
	}
	sql.append(")") ;
	pstmt = conn.prepareStatement(sql.toString()) ;
	rs = pstmt.executeQuery() ;
%>
<%
	while(rs.next()){
		int pid = rs.getInt(1) ;
		String name = rs.getString(2) ;
		String note = rs.getString(3) ;
		double price = rs.getDouble(4) ;
		int amount = rs.getInt(5) ;
%>
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE6"><%=pid%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=name%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=price%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=amount%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=note%></span></td>
		<td align="center" valign="middle"><span class="STYLE6">
			<input type="text" name="<%=pid%>" value="<%=cars.get(pid)%>" size="3" maxlength="3">
		</td>
	</TR>
<%
	}
%>
<%
	if(count == 0){
%>
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle" colspan="6"><span class="STYLE6">��ʱû�й����κ���Ʒ��</span></td>
	</TR>
<%
	} else {
%>
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle" colspan="6"><span class="STYLE6">
			<input type="submit" value="�޸�����">
			<input type="button" value="ȥ����" onclick="gocheck()">
		</span></td>
	</TR>
<%
	}
%>
</table>
</form>
<%
	conn.close() ;
} else {
%>
<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle" colspan="6"><span class="STYLE6">��ʱû�й����κ���Ʒ��</span></td>
	</TR>
</TABLE>
<%
}
%>
</center>
</body>
</html>