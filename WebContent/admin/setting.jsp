<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>设置中心页面</title>
	<link rel="stylesheet" type="text/css" href="../lib/checkBox.css">
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
		}
		#content{
			margin-top: 50px;
			width: 100%;
			padding: 3em;
			/* display: flex;
			justify-content: center; */
		}
		.subSetting {
			display: flex;
			/* flex-direction: row; */
			width: 80%;
			margin: 0 auto;
			justify-content: space-between;
			flex-wrap: wrap;
		}
		.panel {
		  	padding: 10px;
		  	margin: 10px;
		  	-webkit-box-shadow: 0 1px 1px #5d9cec;
		  	width: 100%;
		  	box-shadow: 0 1px 1px #5d9cec;
		}
		form{
			margin-bottom: 20px;
			width: 48%;
		}
	</style>
</head>
<body>
	<s:bean name="db.SystemMsgDAO">
		<s:set value="getRegistrationSystemStatus()" var="rsStatus" />
		<s:set value="getIdentificationSystemStatus()" var="isStatus" />
		<s:set value="getRegistStatus()" var="rStatus" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div class="subSetting">
			<form action="updateStatus.action" method="get" id="rsStatusForm">
				<div class="panel">
				    <input name="functionType" type="hidden" id="functionType" value="rsStatus" />
					<p>开启/关闭<strong>网上报名系统</strong> &nbsp;&nbsp;
					   <s:if test="#rsStatus==1">
						  <div class='checkbox'>     
						    <input type='checkbox' name="status" id="rsStatus" value="0" checked />
						    <label></label>
						  </div>
						</s:if>
						<s:else>
						  <div class='checkbox'>     
						    <input type='checkbox' name="status" id="rsStatus" value="1"/>
						    <label></label>
						  </div>
						</s:else>
					</p>
					<hr>
					<p>开启该系统，学生可登录网上报名系统进行报名。</p>
					<p>关闭此系统，学生将不能进入网上报名系统。</p>
				</div>
			</form>
			<form action="updateStatus.action" method="post" id="rStatusForm">
				<div class="panel">
				    <input name="functionType" type="hidden" id="functionType" value="rStatus" />
					<p>开启/关闭<strong>报名功能</strong> &nbsp;&nbsp;
					   <s:if test="#rStatus==1">
						  <div class='checkbox'>     
						    <input type='checkbox' id="rStatus" name="status" value="0" checked/>
						    <label></label>
						  </div>
						</s:if>
						<s:else>
						  <div class='checkbox'>     
						    <input type='checkbox' id="rStatus" name="status" value="1"/>
						    <label></label>
						  </div>
						</s:else>
					</p>
					<hr>
					<p>开启此功能，学生可以报名考试。</p>
					<p>关闭此功能，学生只能查看自己的座位安排</p>
				</div>
			</form>
			<form action="updateStatus.action" method="post" id="isStatusForm">
				<div class="panel">
				    <input name="functionType" type="hidden" id="functionType" value="isStatus" />
					<p>开启/关闭<strong>考生身份验证系统</strong> &nbsp;&nbsp;
					   <s:if test="#isStatus==1">
						  <div class='checkbox'>     
						    <input type='checkbox' name="status" id="isStatus" value="0" checked/>
						    <label></label>
						  </div>
						</s:if>
						<s:else>
						  <div class='checkbox'>     
						    <input type='checkbox' name="status" id="isStatus" value="1"/>
						    <label></label>
						  </div>
						</s:else>
					</p>
					<hr>
					<p>开启此系统，监考员可登录该系统进行考生身份验证。</p>
					<p>关闭此系统，监考员将不能登录。</p>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	<s:property value="rs"/>
	$("document").ready(function(){
		$(".menu a:eq(2)").css("color","red");
		
		$("#rsStatus").change(function(){
			$("#rsStatusForm").submit();
		});
		
		$("#rStatus").change(function(){
			$("#rStatusForm").submit();
		});
		
		$("#isStatus").change(function(){
			$("#isStatusForm").submit();
		});
	});
</script>
</html>