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
		height: 100vh;
		display: flex;
		flex-direction: column;
		align-items: center;
		overflow-y: scroll;
	}
	nav{
	    width: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 20;
	    overflow: hidden;
	    border-bottom: 1px solid rgba(30,35,42,.06);
	    box-shadow: 0 1px 3px 0 rgba(0,34,77,.05);
	    background-clip: content-box;
	    color: #fff;
	}
	nav header{
	    height: 50px;
		display: flex;
		align-items: center;
		background: #399cde;
	}
	nav header .logo{
	    width: 20%;
	    text-align: center;
	    font-size: 22px;
		font-weight: 700;
		font-family: Xingkai SC;
	}
	nav header .menu{
		width: 20%;
	    font-size: 14px;
	    display: flex;
	    justify-content: space-around;
	}
	nav header .menu a{
	    color: #fff;
	    text-decoration: none;
	}
	nav header .menu a:hover{
	    color: #000;
	    text-decoration: none;
	}
	nav header .welcome{
		width: 60%;
		display: flex;
		justify-content: flex-end;
		font-size: 12px;
		/* margin-right: 15px; */
	}
	nav header .welcome div{
		margin: 0 15px;
	}
	nav header .welcome a{
		text-decoration: none;
		color: #fff;
	}
	nav header .welcome a:hover,#pwd:hover{
	    color: red;
	    cursor: pointer;
	}
	#mention{
		width: 80%;
		margin-top: 50px;
		}
	#mention>div{
		display: flex;
		justify-content: space-around;
		color: red;
		margin-top: 30px;
	}
	#mention p{
		padding: 0;
		margin: 0;
	}
</style>
</head>
<body>
	<nav>
		<header>
				<div class="logo">
					考生身份验证系统
				</div>
				<div class="menu">
					<a href="authentication.jsp">身份验证</a>
					<a href="infolist.jsp">信息列表</a>
				</div>
				<div class="welcome">
					<div>欢迎进入：<s:property value="#session.teaName"/></div>
					<div id="pwd">修改密码</div>
					<div><a href="../login.jsp"><font size="2">退出</font></a></div>
				</div>
		</header>
	</nav>
	<div id="mention">
		<div>
			<p>考点：</p>
			<p>考场：</p>
			<p>考试科目：</p>
		</div>
	</div>
</body>
</html>