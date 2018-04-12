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
	#stepMenu{
			display: flex;
			width: 100%;
			height: 	20vh;
			position: relative;
			flex-direction: row;
			background: #fff;
			color: #000;
		}
	#stepMenu:before{
		content: "";
		position: absolute;
		top: 15vh;
		width: 100%;
		height: 10px;
		background-color:  #cccccc;
	}
	#stepMenu div{
		width: 15%;
	}
	#stepMenu .tab{
		width: 14%;
		position: relative;
	}
	#stepMenu .tab p{
		text-align: center;
		margin: 0;
		margin-top: calc(15vh - 50px);
		font-size: 14px;
	}
	#stepMenu .tab a{
		text-decoration: none;
		color: #000;
	}
	#stepMenu .tab a:hover{
		cursor: pointer;
	}
	#stepMenu .tab hr{
		width: 100%;
		height: 10px; 
		border: none;
		border-top: 10px solid #cccccc;
		position: absolute;
		top: 15vh;
		margin: 0;
	}
	#stepMenu .tab div{
		width: 30px;
		height: 30px;
		border-radius: 15px;
		text-align: center;
		line-height: 30px;
		background-color: #cccccc;
		color: #978786;
		font-size: 12px;
		position: absolute;
		top: calc(15vh - 10px);
		left: calc(50% - 15px);
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
		<div id="stepMenu">
			<div></div>
			<div class="tab">
				<hr/>
				<div>1</div>
				<p id="text"><a href="editInfo.jsp">填报个人信息</a></p>
			</div>
			<div class="tab">
				<hr/>
				<div>2</div>
				<p><a href="uploadImg.jsp">上传照片</a></p>
			</div>
			<div class="tab">
				<hr/>
				<div>3</div>
				<p><a href="stuInfo.jsp">查看个人信息</a></p>
			</div>
			<div class="tab">
				<hr/>
				<div>4</div>
				<p><a href="enlist.jsp">笔试报名</a></p>
			</div>
			<div class="tab">
				<hr/>
				<div>5</div>
				<p><a href="examArrage.jsp">笔试考场安排</a></p>
			</div>
			<div></div>
		</div>
	</nav>
</body>
</html>