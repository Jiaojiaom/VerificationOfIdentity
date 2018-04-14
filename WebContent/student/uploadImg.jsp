<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>上传照片页面</title>
		<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="../WEB-INF/lib/bootstrap.min.css">
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
			margin-top: calc(60px + 20vh);
		}
		#uploadImgTab{
			width: 80%;
			/* background-color: gray; */
		}
		#uploadImgTab form{
			display: flex;
			flex-direction: column;
			align-items: center;
			margin: 20px 0;
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
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div id="uploadImgTab">
			<s:form action="uploadImg" enctype="multipart/form-data" method="post">
				<div>
					<label>上传照片：</label>
					<input type="file" name="img" class="file-loading"/>
					<input type="hidden" name="cardId" value="<s:property value='#session.cardId'/>" />
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
	</div>
</body>
<script type="text/javascript">
	
	$("document").ready(function(){
		$(".tab:eq(1) hr").css("border-top","10px solid #399cde"); 
		$(".tab:eq(1) div").css({"background-color": "#399cde","color": "#fff"});
		$(".tab:eq(1) a").css("color","#399cde");
		var result = "" + "<s:property value='tip'/>";
		if(!result ==""){
			if(result == "1"){
				alert("上传成功！");
			}
			else
				alert("照片格式或大小有误，请重新上传！");
		}
	});
</script>
</html>