<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<li><a href="reg.jsp">회원등록</a></li>
<li><a href="list.jsp">회원목록조회/수정</a></li>
<li><a href="sales.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로.</a></li>
</ul>
</nav>
<section>
<h3>회원목록조회/수정</h3>
<div>
<table border="1">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
</tr>
<%
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String password="1234";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(url, user, password);

String sql= "SELECT t1.custno, t1.custname, t1.grade, SUM(t2.price) price FROM member_tbl_02 t1 JOIN money_tbl_02 t2 ON t1.custno = t2.custno GROUP BY t1.custno, t1.custname, t1.grade ORDER BY price DESC";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
while(rs.next()){ 
%>
<tr>
	<td><%=rs.getInt("custno")%></td>
	<td><%=rs.getString("custname")%></td>
	<td><%=rs.getString("grade")%></td>
	<td><%=rs.getString("price")%></td>
</tr>
<%}
rs.close();ps.close();conn.close();
%>
</table>
</div>
</section>
<footer>
HRDKOREA Copyright@2018
</footer>
</body>
</html>