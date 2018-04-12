<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查看个人信息页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="../../WEB-INF/lib/bootstrap.min.css">
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
		#infoTab{
			width: 70%;
			margin-top: 20px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		#info{
			width: 100%;
			display: flex;
			justify-content: space-between;
			/* background-color: gray; */
		}
		#infoText{
			width: 50%;
			display: flex;
			flex-direction: column;
		}
		#infoText label{
			width: 30%;
			display: inline-block;	
		}
		#infoText div{
			margin: 0 0 20px 0;
		}
		#infoText input[type="text"], #infoText select{
			width: 60%;
		}
		#infoImg div{
			width: 100px;
			border: 1px solid #000;
		}
		#infoTab button{
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
	</style>
</head>
<body>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getStudentMsg(#session.cardId).get(0)" var="stuMsgList" />
	</s:bean>
	<s:bean name="db.ProvinceMsgDAO">
		<s:set value="getProvinceName()" var="provinceList" />
	</s:bean>
	<s:bean name="db.CollegeMsgDAO">
		<s:set value="getCollegeName()" var="collegeList" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div id="infoTab">
			<div id="info">
				<div id="infoText">
					<div>
						<label for="stuName">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
						<s:textfield name="stuName" label="姓  名" value="%{#session.stuName}" disabled="true"/>
					</div>
					<div style=" display: flex">
						<label for="stuSex">性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
						<div style="width: 50%; margin:0"><s:radio name="stuSex" label="性  别" list=" #{'M':'男','F':'女' }" value="%{#stuMsgList.get('sex')}" listKey="key" listValue="value" disabled="true"/></div>
					</div>
					<div>
						<label for="cardType">证件类型:</label>
						<s:select name="cardType" label="证件类型" list=" #{'0':'居民身份证','1':'军人证','2':'港澳居民住来内地通行证','3':'台湾居民来往大陆通行证','4':'护照'}" value="%{#stuMsgList.get('cardtype')}" listKey="key" listValue="value" disabled="true"/>
					</div>
					<div>
						<label for="cardId">证件号码:</label>
						<s:textfield name="cardId" label="证件号码" value="%{#session.cardId}" disabled="true"/>
					</div>
					<div>
						<label for="birth">出生日期:</label>
						<s:textfield name="birth" label="出生日期" value="%{#stuMsgList.get('birth')}" disabled="true"/>
						<%-- <sx:datetimepicker name="birth"s label="出生日期"  type="date" value="%{#stuMsgList.get('birth')}" displayFormat="yyyy年MM月DD日"/> --%>
					</div>
					<div>
						<label for="provinceId">户籍所在省份:</label>
			 			<s:select name="provinceId" label="户籍所在省份" list="%{#provinceList}" value="%{#stuMsgList.get('provinceid')}" listKey="provinceid" listValue="provincename" disabled="true"/>
					</div>
					<div>
						<label for="collegeId">学校名称:</label>
			 			<s:select name="collegeId" label="学校名称" list="%{#collegeList}" value="%{#stuMsgList.get('collegeid')}" listKey="collegeid" listValue="collegename" disabled="true"/>
					</div>
					<div>
						<label for="studyType">学习形式:</label>
			 			<s:select name="studyType" label="学习形式" list="#{'0':'普通全日制','1':'非全日制' }" value="%{#stuMsgList.get('studytype')}" listKey="key" listValue="value" disabled="true"/>
					</div>
					<div>
						<label for="academyClass">院系/班级:</label>
			 			<s:textfield name="academyClass" label="院系/班级" value="%{#stuMsgList.get('academyclass')}" disabled="true"/>
					</div>
					<div>
						<label for="email">电子邮箱:</label>
			 			<s:textfield name="email" label="电子邮箱" value="%{#stuMsgList.get('email')}" disabled="true"/>
					</div>
					<div>
						<label for="phoneNumber">手机号码:</label>
			 			<s:textfield name="phoneNumber" label="手机号码" value="%{#stuMsgList.get('phonenumber')}" disabled="true"/>
					</div>
					<div>
						<label for="address">通信地址:</label>
			 			<s:textfield name="address" label="通信地址" value="%{#stuMsgList.get('address')}" disabled="true"/>
					</div>
				</div>
				<div id="infoImg">
					<div><img src="../images/idphoto.jpg" alt="照片未显示" width="100%" height="100%"/></div>
					<%-- <p>照片状态：<span style="color:red">未审核</span></p> --%>
				</div>
			</div>
			<button type="button">修改信息</button>
		</div>
	</div>
</body>
<script type="text/javascript">
 	$("document").ready(function(){
		$(".tab:eq(2) hr").css("border-top","10px solid #399cde");
		$(".tab:eq(2) div").css({"background-color": "#399cde","color": "#fff"});
		$(".tab:eq(2) a").css("color","#399cde");
	});
</script>
</html>