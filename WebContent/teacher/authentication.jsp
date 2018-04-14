<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>身份验证页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="../lib/fileinput.js"></script>
	<link href="../lib/fileinput.css" rel="stylesheet">
	
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
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
		#content{
			width: 100%;
			display: flex;
			justify-content: center;
		}
		#content #authenticationTab{
			width: 80%;
		}
		#content #authenticationTab form{
			display: flex;
			flex-direction: column;
			align-items: center;
			margin: 50px 0;
		}
		#content #authenticationTab form label{
			margin: 20px 0;
		}
	</style>
</head>
<body>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div id="authenticationTab">
			<s:form action="cardRecognition" enctype="multipart/form-data" method="post">
					<div>
						<label>上传考生证件照片:</label>
						<input type="file" name="cardImg" class="file"  data-show-preview="false"/>
						<input type="hidden" name="examLocationId" value="<s:property value='#session.examLocationId'/>" />
					</div>
					<s:submit name="upload" value="比对"/>
			</s:form>
			<s:form action="faceRecognition" enctype="multipart/form-data" method="post">
					<div>
						<label>上传考生脸部照片：</label>
						<input type="file" name="faceImg" class="file" data-show-preview="false"/>
						<s:if test="stuId != null">
							<input type="hidden" name="stuId" value="<s:property value='stuId'/>" />
						</s:if>
					</div>
					<s:submit name="upload" value="比对"/>
			</s:form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("document").ready(function(){
		$(".menu a:eq(0)").css("color","red");
		var result = ""+ "<s:property value='tip'/>";
		if(!result==""){
			console.log(result);
			if(result=="0"){
				alert("信息不相符，比对不通过");
			}
			if(result=="1")
				alert("信息相符，比对通过");
			else if(result=="2")
				alert("比对失败，请重试");
			else if(result=="3")
				alert("照片格式或大小有误，请重新上传！");
			else if(result=="4")
				alert("是同一个人，比对通过");
			else alert("不是同一个人，比对不通过");
				
		}
	});
</script>
</html>