<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>登录页面</title>
	<meta charset="UTF-8">
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<style>
body {
    /* background: #f7fafc; */
    margin: 0 auto;
    padding: 0;
    display: flex;
    /* justify-content: space-between; */
    flex-direction: column;
    height: 100vh;
}
#content {
	background: #f9f9f9;
	box-shadow: 0 1px 0 #fff inset;
	border: 1px solid #c4c6ca;
	margin: 0 auto; 
	padding: 25px 0 0;
	position: relative;
	text-align: center;
	text-shadow: 0 1px 0 #fff;
	width: 400px;
}
#content h1 {
	color: #7E7E7E;
    text-align: center;
    font-size: 30px;
	font-weight: 500;
	margin: 10px 0 30px;
}
/* #content:after,
#content:before {
	background: #f9f9f9;
	border: 1px solid #c4c6ca;
	content: "";
	display: block;
	height: 100%;
	position: absolute;
	width: 100%;
}
#content:after {
	transform: rotate(2deg);
	top: 0;
	z-index: -1;
}
#content:before {
	transform: rotate(-3deg);
	top: 0;
	z-index: -2;
} */
#content form input{
	margin: 0 0 15px;
}
#content .radio{
	font-size: 15px;
}
#content form input[type="submit"]{
    background: #0f88eb;
    box-shadow: none;
    border: 0;
    border-radius: 3px;
    line-height: 31px;
    color: #fff;
    height: 31px;
    width: 30%;
}
#content form a{
	font-size: 12px;
	text-decoration: none;
	color: #3da3e2;
	/* margin: 0 30px; */
}
#content form input[type="text"],
#content form input[type="password"] {
	border-radius: 3px;
	box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	transition: all 0.5s ease;
	border: 1px solid #c8c8c8;
	color: #777;
	padding: 15px 10px 15px 40px;
	width: 80%;
	
}
#content form input[type="text"]:focus,
#content form input[type="password"]:focus, #content form select:focus{
	box-shadow: 0 0 2px #ed1c24 inset;
	background-color: #fff;
	border: 1px solid #ed1c24;
	outline: none;
}

.main{
	height: 93vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background:  url(images/homepage-hero.jpg) no-repeat center bottom;
}
header{
	display: flex;
	height: 7vh;
	padding: 8px;
	padding-left: 20px;
	align-items: center;
}
header h2{
	font-size: 23px;
    font-weight: 500;
    color: #ba2312;
}
footer{
	display: flex;
    flex-direction: column;
}
footer img{
	width: 100%;
}
footer .copyright{
	background-color:#000;
	color: #666666;
    height: 10vh;
    font-size: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
}
#username{
    background:  url(http://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat;
    position: absolute;
    top: 75px;
    left: 8px;
    width: 34px;
    height: 34px;
}
#password{
    background:  url(http://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat;
    position: absolute;
    top: 135px;
    left: 8px;
    width: 34px;
    height: 34px;
}
.radio{
	display: flex;
	justify-content: space-around;
}
#content form #college{
	width: calc(80% + 50px);
	display: flex;
	align-items: center;
	margin: 0 auto;
	margin-bottom: 15px;
	height: 30px;
}
#content form #college label{
	width: 25%;
	text-align: left;
}
#content form #college select{
	width: 75%;
	font-size: 14px;
	padding: 20px;
	height: 30px;
	/* line-height: 16px; */
}
#username { background-position: 10px 10px !important }
#password { background-position: 10px -53px !important }
#cardId { background-size: 28px}
</style>
</head>
<body>
	<header>
		<h2>考生身份验证系统</h2>
	</header>
	<s:bean name="db.CollegeMsgDAO">
		<s:set value="getCollegeName()" var="collegeList" />
	</s:bean>
	<div class="main">
		<section id="content">
			<form action="teaAdminlogin.action" method="post">
				<!-- <h1>登录页面</h1> -->
				<div id="college">
					<label for="collegeId">所在大学：</label>
					<select name="collegeId">
						<s:iterator value="#collegeList">
							<option value="<s:property value='collegeid'/>"><s:property value="collegename"/></option>
						</s:iterator>
					</select>
				</div>
				<div>
					<input type="text" placeholder="工号" id="" name="id" />
					<div id ="username"></div>
				</div>
				<div>
					<input type="password" placeholder="密码" id="" name="password" />
					<div id ="password"></div>
				</div>
				<div class="radio">
					<div><input type="radio" name="role" value="tea" checked="checked">&nbsp;教师</div>
					<div><input type="radio" name="role" value="admin">&nbsp;管理员</div>
				</div>
				 <div>
					<input type="submit" value="登录" />
				</div> 
				 <div style="display: flex; justify-content:flex-end; padding: 0 0 25px 0">
		        		<a href="editPwd.action" style="margin-right: 15px">忘记密码?</a>
		        	</div>
			</form><!-- form -->
		</section><!-- content -->
	</div>

<!-- <footer>
		
		<div class="copyright">Copyright © 浙江机电职业技术学院材料技术系 地址：浙江海宁市长安镇青年路999号 浙ICP备10046065号
           </div>

</footer> -->
</body>
<script type="text/javascript">
	/* $(document).ready(function(){
		var result = ""+ "<s:property value='tip'/>";
		if(result != ""){
			if(result == "1")
				alert("密码输入有误，请重新输入！");
			else if(result == "0")
				alert("所在学校或工号输入有误，请重新输入！");
			else
				alert("工号输入有误，请重新输入！");
		}
	}); */
	<s:property value="rs"/>
	var fail = "" + "<s:property value='#parameters.fail'/>";
	if(fail != ""){
		alert("考生身份验证系统已关闭，无法进入");
		window.location.href = "login.jsp";
	}
</script>
</html>
