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
<h3>쇼핑몰회원관리 프로그램</h3>
쇼핑몰 회원정보와 회원매출정보 데이터베이스...
</section>
<footer>
HRDKOREA Copyright@2018
</footer>
</body>
</html>