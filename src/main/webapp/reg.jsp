<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int gencustno = 0;

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String password="1234";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(url, user, password);

String sql="select max(custno) from member_tbl_02";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	gencustno=rs.getInt("max(custno)")+1;
}
rs.close(); ps.close(); conn.close();
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
<script>
function confirm(){
	var custno=document.getElementById("custno");
	var custname=document.getElementById("custname");
	var phone=document.getElementById("phone");
	var address=document.getElementById("address");
	var joindate=document.getElementById("joindate");
	var grade=document.getElementById("grade");
	var city=document.getElementById("city");
	
	if(custno.value===""){
		alert("회원번호가	 입력되지 않았습니다.");
		custno.focus();
		return false;
	}
	if(custname.value===""){
		alert("회원성명이 입력되지 않았습니다.");
		custname.focus();
		return false;
	}
	if(phone.value===""){
		alert("회원전화번호가 입력되지 않았습니다.");
		phone.focus();
		return false;
	}
	if(address.value===""){
		alert("회원주소가 입력되지 않았습니다.");
		address.focus();
		return false;
	}
	if(joindate.value===""){
		alert("회원가입일자가 입력되지 않았습니다.");
		joindate.focus();
		return false;
	}
	if(grade.value===""){
		alert("회원등급이 입력되지 않았습니다.");
		grade.focus();
		return false;
	}
	if(city.value===""){
		alert("도시코드가 입력되지 않았습니다.");
		city.focus();
		return false;
	}
}
</script>
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
<h3>홈쇼핑 회원등록</h3>
<div>
<form action="regProc.jsp" method="post" onsubmit="return confirm()">
<table border="1" >
<tr>
	<td>회원번호</td>
	<td><input type="text" name="custno" id="custno" value="<%=gencustno%>"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td><input type="text" name="custname" id="custname"></td>
</tr>
<tr>
	<td>회원전화번호</td>
	<td><input type="text" name="phone" id="phone"></td>
</tr>
<tr>
	<td>회원주소</td>
	<td><input type="text" name="address" id="address"></td>
</tr>
<tr>
	<td>가입일자</td>
	<td><input type="text" name="joindate" id="joindate"></td>
	</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,C:직원]</td>
	<td><input type="text" name="grade" id="grade"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td><input type="text" name="city" id="city"></td>
</tr>
<tr>
	<td colspan="2" style="text-align: center">
		<input type="submit" value="등록">
		<input type="button" value="조회" onclick="location.href='list.jsp'">
	</td>
</tr>
</table>
</form>
</div>
</section>
<footer>
HRDKOREA Copyright@2018
</footer>
</body>
</html>