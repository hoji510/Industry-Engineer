<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int custno=Integer.parseInt(request.getParameter("custno"));

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String password="1234";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(url, user, password);

String sql="select * from member_tbl_02 where custno=?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1, custno);
ResultSet rs=ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
margin: 0;
padding: 0;
}
header{
background-color: blue;
font-size: 30px;
color:white;
width: 100%;
height: 100px; 
text-align: center;
line-height: 100px;
}
nav{
background-color: mediumpurple;
color: white; 
}
nav>ul{
display:flex;
list-style: none;
}
nav>ul>li{
padding:10px;
}
h3{
text-align: center;
}
section{
width: 100%;
background-color: gray;
height:700px;
padding:20 20px;
}
section > h3 {
text-align: center;
padding: 30px 0;
}
table{
margin:auto;
}
footer{
width: 100%;
background-color: blue;
height: 70px; 
text-align: center;
line-height: 70px;
color:white;
}
a{
color:white;
text-decoration: none;
}
</style>
<body>
<header>
쇼핑몰 회원관리 ver 1.8
</header>
<nav>
<ul>
<li><a href="">회원등록</a></li>
<li><a href="list.jsp">회원목록조회/수정</a></li>
<li><a href="">회원매출조회</a></li>
<li><a href="index.jsp">홈으로.</a></li>
</ul>
</nav>
<section>
<h3>홈쇼핑 회원등록</h3>
<div>
<%
if(rs.next()){
%>
<form action="updateProc.jsp" method="post" onsubmit="return confirm()">
<table border="1" >
<tr>
	<td>회원번호</td>
	<td><input type="text" name="custno" id="custno" value="<%=rs.getInt("custno")%>"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td><input type="text" name="custname" id="custname" value="<%=rs.getString("custname")%>"></td>
</tr>
<tr>
	<td>회원전화번호</td>
	<td><input type="text" name="phone" id="phone" value="<%=rs.getString("phone")%>"></td>
</tr>
<tr>
	<td>회원주소</td>
	<td><input type="text" name="address" id="address" value="<%=rs.getString("address")%>"></td>
</tr>
<tr>
	<td>가입일자</td>
	<td><input type="text" name="joindate" id="joindate"  value="<%=rs.getDate("joindate")%>"></td>
	</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,C:직원]</td>
	<td><input type="text" name="grade" id="grade"  value="<%=rs.getString("grade")%>"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td><input type="text" name="city" id="city" value="<%=rs.getString("city")%>"></td>
</tr>
<tr>
	<td colspan="2" style="text-align: center">
		<input type="submit" value="수정">
		<input type="button" value="조회" onclick="location.href='list.jsp'">
	</td>
</tr>
</table>
</form>
<%
}
rs.close(); ps.close(); conn.close();
%>
</div>
</section>
<footer>
HRDKOREA Copyright@2018
</footer>
</body>
</html>