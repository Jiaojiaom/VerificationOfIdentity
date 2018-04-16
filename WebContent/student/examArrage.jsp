<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>笔试考场安排页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="../WEB-INF/lib/bootstrap.min.css">
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
		}
		#content{
			width: 100%;
			display: flex;
			justify-content: center;
			margin-top: calc(60px + 20vh);
		}
		#examArrageTab{
			width: 70%;
			margin: 20px 0;
		}
		#examArrageTab table{
			width: 100%;
			border-collapse: collapse;
		}
		#examArrageTab table tr{
			height: 30px;
			text-align: center;
		}
		#examArrageTab table tr th{
			font-weight: normal;
			width: 20%;
		}
	</style>
</head>
<body>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getExamInfo(#session.cardId)" var="examList" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div id="examArrageTab">
			<table border="1">
				<tr>
					<th>考试科目</th>
					<th>考点</th>
					<th>考试时间</th>
					<th>考试地点</th>
					<th>座位号</th>
				</tr>
				<s:if test="#examList != null">
					<tr>
						<td><s:property value="#examList.get('subjectname')"/></td>
						<td><s:property value="#examList.get('testingpointname')"/></td>
						<td><s:property value="#examList.get('subjectdate')"/>&nbsp;<s:property value="#examList.get('subjectstarttime')"/>-<s:property value="#examList.get('subjectendtime')"/></td>
						<td><s:property value="#examList.get('building')"/>&nbsp;<s:property value="#examList.get('classroom')"/></td>
						<td><s:property value="#examList.get('examseatnumber')"/></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td colspan="5" align="center">未有考场信息</td>
					</tr>
				</s:else>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
 	$("document").ready(function(){
		$(".tab:eq(4) hr").css("border-top","10px solid #399cde");
		$(".tab:eq(4) div").css({"background-color": "#399cde","color": "#fff"});
		$(".tab:eq(4) a").css("color","#399cde");
	});
</script>
</html>