<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function changeColor(obj, color){
		obj.bgColor = color;
	}
	function updateMenber(){
		window.location = "member_update.jsp";//更新页面
	}
</script>
</head>
<body>
<jsp:include page = "login_filter.jsp"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<center>
	<h1>结算清单</h1>
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
	String sql = "SELECT mid, name, address, telephone, zipcode FROM member WHERE mid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("id"));
	rs = pstmt.executeQuery();
%>
<%
	if(rs.next()){
		//查找到了信息
		String mid = rs.getString(1);
		String name = rs.getString(2);
		String address = rs.getString(3);
		String telephone = rs.getString(4);
		String zipcode = rs.getString(5);
%>
<table border = "1" width = "100%" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2">
	<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
		<td colspan = "2">
			用户信息
			<input type = "button" value = "修改用户信息" onclick = "updateMember()">
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">用户编号：</span></td>
		<td><font size="2"><%=mid%></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">真实姓名：</span></td>
		<td><font size="2"><%=name%></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">联系电话：</span></td>
		<td><font size="2"><%=telephone%></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">地&nbsp;&nbsp;&nbsp;&nbsp;址：</span></td>
		<td><font size="2"><%=address%></font></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><span class="STYLE10">邮政编码：</span></td>
		<td><font size="2"><%=zipcode%></font></td>
	</tr>
	</table>
<%
	}
%>
<%
	//取出所购买的全部商品的编号及数量
	Map<Integer, Integer> cars = (Map<Integer, Integer>)session.getAttribute("allpid");
	if(cars != null){
		Set<Integer> key = cars.keySet();//取得全部的key
		StringBuffer psql = new StringBuffer();//循环修改内容的时候使用
		psql.append("SELECT pid,name,note,price,amount FROM product WHERE pid IN (") ;
		int count = 0;
		Iterator<Integer> iter = key.iterator();
		while(iter.hasNext()){
			count ++;
			psql.append(iter.next());
			if(count <= key.size() - 1){
				psql.append(",");
			}
		}
		psql.append(")");
		pstmt = conn.prepareStatement(psql.toString());
		rs = pstmt.executeQuery();
%>
<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')" >
			<td colspan="6">购买商品信息</td>
		</tr>
	</tr>
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE10">编号</span></td>
		<td align="center" valign="middle"><span class="STYLE10">名称</span></td>
		<td align="center" valign="middle"><span class="STYLE10">价格</span></td>
		<td align="center" valign="middle"><span class="STYLE10">数量</span></td>
		<td align="center" valign="middle"><span class="STYLE10">简介</span></td>
		<td align="center" valign="middle"><span class="STYLE10">数量</span></td>
	</TR>
	<%
	double sum = 0.0 ;	// 保存总价
	while(rs.next()){
		int pid = rs.getInt(1) ;
		String name = rs.getString(2) ;
		String note = rs.getString(3) ;
		double price = rs.getDouble(4) ;
		int amount = rs.getInt(5) ;
		sum += price * cars.get(pid) ;
%>
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE6"><%=pid%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=name%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=price%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=amount%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=note%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=cars.get(pid)%></td>
	</TR>
<%
	}
%>
<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle" colspan="6"><span class="STYLE6">总价钱：<%=sum%></td>
	</TR>
</TABLE>
<%
	}
%>
<%
	conn.close() ;
%>
</center>
</body>
</html>