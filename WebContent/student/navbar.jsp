<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>导航栏</title>
<style type="text/css">
	body{
	margin: 0;
	padding: 0;
	background: #fff;
	width: 100%;
	height: 120vh;
	display: flex;
	flex-direction: column;
	align-items: center;
}
nav{
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 20;
    overflow: hidden;
    background: #399cde;
    border-bottom: 1px solid rgba(30,35,42,.06);
    box-shadow: 0 1px 3px 0 rgba(0,34,77,.05);
    background-clip: content-box;
    color: #fff;
}
nav header{
    height: 50px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}
nav header .logo{
    width: 20%;
    text-align: center;
    font-size: 25px;
	font-weight: 700;
	font-family: Xingkai SC;
}
nav header .menu{
	width: 20%;
    font-size: 12px;
    display: flex;
    justify-content: space-around;
}
nav header .menu a{
    text-decoration: none;
    color: #fff;
}
nav header .menu a:hover,#pwd:hover{
    color: red;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
	<nav>
		<header>
				<div class="logo">
					网上报名系统
				</div>
				<div class="menu">
					<div>欢迎进入：<s:property value="#session.stuName"/></div>
					<div id="pwd">修改密码</div>
					<div><a href="login.jsp"><font size="2">退出</font></a></div>
				</div>
		</header>
	</nav>
</body>
</html>