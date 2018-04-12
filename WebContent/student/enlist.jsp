<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>笔试报名页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="../WEB-INF/lib/bootstrap.min.css">
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
		}
		input[type="text"],select{
			line-height: 16px;
			font-size: 14px;
		}
		#content{
			width: 100%;
			display: flex;
			justify-content: center;
			margin-top: calc(60px + 20vh);
		}
		#enlistTab form{
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		#enlistTab form>div{
			display: flex;
			margin: 20px 0 40px 0;
			width: 100%;
		}
		#enlistTab form>div>label{
			width: 100px;
			font-weight: bold;
		}
		#enlistTab form div div{
			margin-left: 50px;
		}
		input[type="submit"]{
			background: #399cde;
		    box-shadow: none;
		    border: 0;
		    border-radius: 3px;
		    line-height: 31px;
		    color: #fff;
		    height: 31px;
		    width: 20%;
		    margin-top: 15px;
		    letter-spacing: 8px;
		}
		#enlistTab #enlistInfo{
			/* display: flex;
			flex-direction: column;
			align-items: center; */
			margin: 20px 0;			
		}
		#enlistTab #enlistInfo div{
			display: flex;
			justify-content:space-between;
			align-items: center;
			width: 100%;
			margin: 20px 0;
		}
		#enlistTab #enlistInfo button{
			background: #CD5C5C;
		    box-shadow: none;
		    border: 0;
		    border-radius: 3px;
		    color: #fff;
		    width: 70px;
		   /*  height: 20px; */
		    line-height: 30px;
		    margin: 0;
		    padding: 0;
		}
		#enlistTab #enlistInfo table{
			border-collapse: collapse;
			width: 100%;
		}
		#enlistTab #enlistInfo table tr{
			height: 30px;
		}
		#enlistTab #enlistInfo table th{
			font-weight: normal;
		}
		#enlistTab #mention{
			margin: 80px 0;
			color: red;
		}
		#enlistTab #mention ul{
			margin: 0;
			padding: 0;
		}
		#enlistTab #mention ul li{
			list-style: none;
			margin: 10px;
		}
	</style>
</head>
<body>
	<s:bean name="db.ProvinceMsgDAO">
		<s:set value="getProvinceName()" var="provinceList" />
	</s:bean>
	<s:bean name="db.CityMsgDAO">
		<s:set value="getCityName()" var="cityList" />
	</s:bean>
	<s:bean name="db.TestingPointMsgDAO">
		<s:set value="getTestingPointName()" var="testingPointList" />
	</s:bean>
	<s:bean name="db.SubjectMsgDAO">
		<s:set value="getSubjectName()" var="subjectList" />
	</s:bean>
	<s:include value="navbar.jsp">
	</s:include>
	<div id="content">
		<div id="enlistTab">
			<s:form action="enlist" method="post">
				<div>
					<label class="title">请选择考点</label>
					<div>
						<label for="provinceId">省份：</label>
						<s:select name="provinceId" label="省份：" list="%{#provinceList}" listKey="provinceid" listValue="provincename" value="请选择省份"/>
					</div>
					<div>
						<label for="cityId">城市：</label>
						<s:select name="cityId" label="城市：" list="%{#cityList}" listKey="cityid" listValue="cityname" value="请选择城市"/>
					</div>
					<div>
						<label for="testingPointId">考点：</label>
						<s:select name="testingPointId" label="考点：" list="%{#testingPointList}" listKey="testingpointid" listValue="testingpointname" value="请选择考点"/>
					</div>
				</div>
				<div>
					<label class="title">请选择考试科目</label>
					<div>
						<label for="subjectId">科目：</label>
						<s:select name="subjectId" label="科目：" list="%{#subjectList}" listKey="subjectid" listValue="subjectname" value="请选择科目"/>
					</div>
				</div>
				<s:submit name="enlistbtn" value="确认报名"/>
			</s:form>
			<div id="enlistInfo">
				<div id="header">
					<h4>考试报名信息</h4>
					<button type="button">删&nbsp;&nbsp;除</button>
				</div>
				<table border="1">
					<tr>
						<th width="33%">考试科目</th>
						<th width="34%">考点</th>
						<th width="33%">报名状态</th>
					</tr>
				</table>
			</div>
			<div id="mention">
				<h4>特别提示：</h4>
				<ul>
					<li>（1）考生请慎重选择考点。</li>
					<li>（2）若需要重新报名，请先删除原报名信息。</li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
 	$("document").ready(function(){
		$(".tab:eq(3) hr").css("border-top","10px solid #399cde");
		$(".tab:eq(3) div").css({"background-color": "#399cde","color": "#fff"});
		$(".tab:eq(3) a").css("color","#399cde");
	});
</script>
</html>