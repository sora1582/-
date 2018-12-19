<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*,factory.*,dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function changeColor(obj, color){
		obj.bgColor = color;
	}
</script>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%!
	public static final String URL = "emp_list.jsp";
%>
<%
	/* 声明查询所需要的信息 */
	int currentPage = 1;
	int lineSize = 3;
	long allRecorders = 0;
	String KeyWord = request.getParameter("kw");
%>
<%
	/* 得到查询所需要的信息 */
	try{
		currentPage = Integer.parseInt(request.getParameter("cp"));
	}catch(Exception e){}
	try{
		lineSize = Integer.parseInt(request.getParameter("ls"));
	}catch(Exception e){}
	
	if(KeyWord == null){
		KeyWord = "";//如果模糊查询没有关键字，则表示查询全部
	} 
%>
<%
	/* 调用那些类 */
	IEmpDAO dao = DAOFactory.getIEmpDAOInstance();
	List<Emp> all = dao.findAll(KeyWord, currentPage, lineSize);
	allRecorders = dao.getAllCount(KeyWord);
%>
<!-- 以表格显示出信息 -->
<center>
	<h1>雇员列表</h1>
	<jsp:include page = "split_page_plugin.jsp">
	<jsp:param name = "allRecorders" value = "<%= allRecorders %>"/>
	<jsp:param name = "url" value = "<%= URL %>"/>
	</jsp:include>
	
	<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
		<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE10">编号</span></td>
		<td align="center" valign="middle"><span class="STYLE10">姓名</span></td>
		<td align="center" valign="middle"><span class="STYLE10">职位</span></td>
		<td align="center" valign="middle"><span class="STYLE10">雇佣日期</span></td>
		<td align="center" valign="middle"><span class="STYLE10">工资</span></td>
		<td align="center" valign="middle"><span class="STYLE10">奖金</span></td>
		<td align="center" valign="middle" colspan="2"><span class="STYLE10">操作</span></td>
		</TR>
	<%
		Iterator<Emp> iter = all.iterator();
		while(iter.hasNext()){
			Emp emp = iter.next();
	%>
		<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getEmpno()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getEname()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getJob()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getHiredate()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getSal()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=emp.getComm()%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><a href="emp_update.jsp?empno=<%=emp.getEmpno()%>&cp=<%=currentPage%>&ls=<%=lineSize%>">修改</a></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><a href="emp_delete_do.jsp?empno=<%=emp.getEmpno()%>&cp=<%=currentPage%>&ls=<%=lineSize%>">删除</a></span></td>
		</TR>
	<%
		}
	%>
	</table>
</center>
</body>
</html>