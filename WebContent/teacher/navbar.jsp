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
		overflow:auto；
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
		margin-top: 50px;
		width: 100%;
	}
	#mention>div{
		width: 80%;
		margin: 0 auto;
	}
	#mention>div>div{
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
	<<%-- s:bean name="db.TeacherMsgDAO">
		<s:set value="getTeaMsg(#session.teaId,#session.collegeId)" var="teaMsgList" scope="session"/>
	</s:bean> --%>
	<s:bean name="db.SubjectMsgDAO">
		<s:set value="getSubjectName().get(0)" var="subjectList" />
	</s:bean>
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
			<div>
				<p>考点：<s:property value="#session.testingPointName"/></p>
				<p>考场：<s:property value="#session.building"/><s:property value="#session.classroom"/></p>
				<p>考试科目：<s:property value="#subjectList.subjectname"/></p>
			</div>
		</div>
	</div>
</body>
</html>