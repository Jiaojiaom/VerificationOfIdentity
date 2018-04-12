<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <%@ taglib prefix="sx" uri="/struts-dojo-tags"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网上报名页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="../WEB-INF/lib/bootstrap.min.css">
	<%-- <sx:head/> --%>
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
		}
		#menu{
			display: flex;
			width: 100%;
			height: 	20vh;
			position: relative;
			flex-direction: row;
			margin-top: 5vh;
		}
		#menu:before{
			content: "";
			position: absolute;
			top: 15vh;
			width: 100%;
			height: 10px;
			background-color:  #cccccc;
		}
		#menu div{
			width: 15%;
		}
		#menu .tab{
			width: 14%;
			position: relative;
		}
		#menu .tab p{
			text-align: center;
			margin: 0;
			margin-top: calc(15vh - 50px);
			font-size: 14px;
		}
		#menu .tab p:hover{
			cursor: pointer;
		}
		#menu .tab bar{
			width: 100%;
			position: relative;
		}
		#menu .tab hr{
			width: 100%;
			height: 10px; 
			border: none;
			border-top: 10px solid #cccccc;
			position: absolute;
			top: 15vh;
			margin: 0;
		}
		#menu .tab div{
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
		input[type="text"],select{
			line-height: 16px;
			font-size: 14px;
		}
		#editInfoTab	{
			width: 80%;
		}
		#editInfo{
			display: flex;
			justify-content: space-between;
			flex-wrap: wrap;
			width: 100%;
			font-size: 14px;
			font-family: "微软雅黑";
		}
		#editInfo div{
			width: 50%;
			margin: 20px 0;
			/* display: flex;
			justify-content:center; */
		}
		#editInfo input[type="text"],#editInfo select{
			width: 50%;
			line-height: 16px;
			font-size: 14px;
		}
		#editInfo div label{
			width: 20%;
			display:inline-block; 
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
		#uploadImgTab{
			margin-top: 20px;
			width: 80%;
			/* background-color: gray; */
		}
		#uploadImgTab form{
			display: flex;
			flex-direction: column;
			align-items: center;
			margin-bottom: 20px;
		}
		#uploadImgTab form div{
			display: flex;
			justify-content: center;
			margin-bottom: 20px;
		}
		#uploadImgTab form div label{
			width: 30%;
			display: inline-block;
		}
		#uploadImgTab input[type="file"]{
			width: 50%;
		}
		#uploadImgTab #mention{
			display: flex;
			justify-content: space-between;
		}
		#uploadImgTab #mention ul{
			margin: 0;
			padding: 0;
		}
		#uploadImgTab #mention ul li{
			list-style: none;
			margin: 10px;
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
	<s:include value="navbar.jsp">
	</s:include>
	<div id="menu">
		<div></div>
		<div class="tab">
			<hr/>
			<div>1</div>
			<p>填报个人信息</p>
		</div>
		<div class="tab">
			<hr/>
			<div>2</div>
			<p>上传照片</p>
		</div>
		<div class="tab">
			<hr/>
			<div>3</div>
			<p>查看个人信息</p>
		</div>
		<div class="tab">
			<hr/>
			<div>4</div>
			<p>笔试报名</p>
		</div>
		<div class="tab">
			<hr/>
			<div>5</div>
			<p>笔试考场安排</p>
		</div>
		<div></div>
	</div>
	<div id="editInfoTab">
		<s:form action="editInfo" method="post">
			<div>
				<label for="stuName">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
				<s:textfield name="stuName" label="姓  名" value="%{#session.stuName}"/>
			</div>
			<div style=" display: flex">
				<label for="stuSex">性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
				<div style="width: 50%; margin:0"><s:radio name="stuSex" label="性  别" list=" #{'M':'男','F':'女' }" value="%{#stuMsgList.get('sex')}" listKey="key" listValue="value"/></div>
			</div>
			<div>
				<label for="cardType">证件类型:</label>
				<s:select name="cardType" label="证件类型" list=" #{'0':'居民身份证','1':'军人证','2':'港澳居民住来内地通行证','3':'台湾居民来往大陆通行证','4':'护照'}" value="%{#stuMsgList.get('cardtype')}" listKey="key" listValue="value"/>
			</div>
			<div>
				<label for="cardId">证件号码:</label>
				<s:textfield name="cardId" label="证件号码" value="%{#session.cardId}"/>
			</div>
			<div>
				<label for="birth">出生日期:</label>
				<s:textfield name="birth" label="出生日期" value="%{#stuMsgList.get('birth')}"/>
				<%-- <sx:datetimepicker name="birth"s label="出生日期"  type="date" value="%{#stuMsgList.get('birth')}" displayFormat="yyyy年MM月DD日"/> --%>
			</div>
			<div>
				<label for="provinceId">户籍所在省份:</label>
	 			<s:select name="provinceId" label="户籍所在省份" list="%{#provinceList}" value="%{#stuMsgList.get('provinceid')}" listKey="provinceid" listValue="provincename"/>
			</div>
			<div>
				<label for="collegeId">学校名称:</label>
	 			<s:select name="collegeId" label="学校名称" list="%{#collegeList}" value="%{#stuMsgList.get('collegeid')}" listKey="collegeid" listValue="collegename"/>
			</div>
			<div>
				<label for="studyType">学习形式:</label>
	 			<s:select name="studyType" label="学习形式" list="#{'0':'普通全日制','1':'非全日制' }" value="%{#stuMsgList.get('studytype')}" listKey="key" listValue="value"/>
			</div>
			<div>
				<label for="academyClass">院系/班级:</label>
	 			<s:textfield name="academyClass" label="院系/班级" value="%{#stuMsgList.get('academyclass')}"/>
			</div>
			<div>
				<label for="email">电子邮箱:</label>
	 			<s:textfield name="email" label="电子邮箱" value="%{#stuMsgList.get('email')}"/>
			</div>
			<div>
				<label for="phoneNumber">手机号码:</label>
	 			<s:textfield name="phoneNumber" label="手机号码" value="%{#stuMsgList.get('phonenumber')}"/>
			</div>
			<div>
				<label for="address">通信地址:</label>
	 			<s:textfield name="address" label="通信地址" value="%{#stuMsgList.get('address')}"/>
			</div>
			<div style="width:100%; display: flex; justify-content: center">
	 			<s:submit name="save" value="确认修改"/>
			</div>
 		</s:form>
	</div>
	<div id="uploadImgTab">
		<s:form action="uploadImg" enctype="multipart/form-data" method="post">
			<div>
				<label>上传照片：</label>
				<input type="file" name="img" class="file-loading"/>
			</div>
			<s:submit name="upload" value="确定上传"/>
		</s:form>
		<div id="mention">
			<div>
				<h4 style="color:red">上传照片要求：</h4>
				<ul>
					<li>（1）本人近6个月的免冠正面证件照；不允许带帽子、头巾、发带、墨镜。</li>
					<li>（2）照片格式及大小：JPG/JPEG/PNG格式；不大于2M。</li>
					<li>（3）照片中显示考生头部和肩部的上部；黑色或彩色均可，白色背景为佳。</li>
					<li>（4）此照片将用于考生身份验证的原始图片，请考生上传照片时慎重选用。</li>
				</ul>
			</div>
			<div>
				<h4>示例如下：</h4>
				<div style=" width:100px; border: 1px solid #000"><img src="../images/idphoto.jpg" alt="证件照" width="100%" height="100%"/></div>
			</div>
		</div>
	</div>
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
				<p>照片状态：<span style="color:red">未审核</span></p>
			</div>
		</div>
		<button type="button">修改信息</button>
	</div>
	<div id="enlistTab">
	笔试报名。。。
	</div>
	<div id="examArrageTab">
	笔试座位安排
	</div>
</body>
<script type="text/javascript">
	$("document").ready(function(){
		$(".tab:eq(0) hr").css("border-top","10px solid #399cde");
		$(".tab:eq(0) div").css({"background-color": "#399cde","color": "#fff"});
		$(".tab:eq(0) p").css("color","#399cde");
		$("#editInfoTab").show();
		$("#uploadImgTab").hide();
		$("#infoTab").hide();
		$("#enlistTab").hide();
		$("#examArrageTab").hide();
		$(".tab:eq(0) p").click(function(){
			$(".tab").each(function(){
				$(this).children("hr").css("border-top","10px solid #cccccc");
				$(this).children("div").css({"background-color": "#cccccc","color": "#978786"});
				$(this).children("p").css("color","#000");
			});
			$(".tab:eq(0) hr").css("border-top","10px solid #399cde");
			$(".tab:eq(0) div").css({"background-color": "#399cde","color": "#fff"});
			$(".tab:eq(0) p").css("color","#399cde");
			$("#editInfoTab").show();
			$("#uploadImgTab").hide();
			$("#infoTab").hide();
			$("#enlistTab").hide();
			$("#examArrageTab").hide();
		});
		$(".tab:eq(1) p").click(function(){
			$(".tab").each(function(){
				$(this).children("hr").css("border-top","10px solid #cccccc");
				$(this).children("div").css({"background-color": "#cccccc","color": "#978786"});
				$(this).children("p").css("color","#000");
			});
			$(".tab:eq(1) hr").css("border-top","10px solid #399cde");
			$(".tab:eq(1) div").css({"background-color": "#399cde","color": "#fff"});
			$(".tab:eq(1) p").css("color","#399cde");
			$("#editInfoTab").hide();
			$("#uploadImgTab").show();
			$("#infoTab").hide();
			$("#enlistTab").hide();
			$("#examArrageTab").hide();
		});
		$(".tab:eq(2) p").click(function(){
			$(".tab").each(function(){
				$(this).children("hr").css("border-top","10px solid #cccccc");
				$(this).children("div").css({"background-color": "#cccccc","color": "#978786"});
				$(this).children("p").css("color","#000");
			});
			$(".tab:eq(2) hr").css("border-top","10px solid #399cde");
			$(".tab:eq(2) div").css({"background-color": "#399cde","color": "#fff"});
			$(".tab:eq(2) p").css("color","#399cde");
			$("#editInfoTab").hide();
			$("#uploadImgTab").hide();
			$("#infoTab").show();
			$("#enlistTab").hide();
			$("#examArrageTab").hide();
		});
		$(".tab:eq(3) p").click(function(){
			$(".tab").each(function(){
				$(this).children("hr").css("border-top","10px solid #cccccc");
				$(this).children("div").css({"background-color": "#cccccc","color": "#978786"});
				$(this).children("p").css("color","#000");
			});
			$(".tab:eq(3) hr").css("border-top","10px solid #399cde");
			$(".tab:eq(3) div").css({"background-color": "#399cde","color": "#fff"});
			$(".tab:eq(3) p").css("color","#399cde");
			$("#editInfoTab").hide();
			$("#uploadImgTab").hide();
			$("#infoTab").hide();
			$("#enlistTab").show();
			$("#examArrageTab").hide();
		});
		$(".tab:eq(4) p").click(function(){
			$(".tab").each(function(){
				$(this).children("hr").css("border-top","10px solid #cccccc");
				$(this).children("div").css({"background-color": "#cccccc","color": "#978786"});
				$(this).children("p").css("color","#000");
			});
			$(".tab:eq(4) hr").css("border-top","10px solid #399cde");
			$(".tab:eq(4) div").css({"background-color": "#399cde","color": "#fff"});
			$(".tab:eq(4) p").css("color","#399cde");
			$("#editInfoTab").hide();
			$("#uploadImgTab").hide();
			$("#infoTab").hide();
			$("#enlistTab").hide();
			$("#examArrageTab").show();
		});
	})
</script>
</html>