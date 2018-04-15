<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../lib/jquery-tab.js"></script>
	<link rel="stylesheet" type="text/css" href="../lib/jquery.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="../lib/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../lib/table.css">
	<%-- <sx:head/> --%>
	<style type="text/css">
		/* 标签页样式 */
		clearfix:after, .container:after, .tab-nav:after {
			content: ".";
			display: block;
			height: 0;
			clear: both;
			visibility: hidden;
		}
		
		/* ==========
				   Setup Page */
		*, *:before, *:after {
			box-sizing: border-box;
		}
		
		body {
			font-family: 'Quicksand', sans-serif;
		}
		
		/* =================
				   Container Styling */
		.container {
			position: relative;
			background: white;
			padding: 3em;
		}
		
		/* ===========
				   Tab Styling */
		.tab-group {
			position: relative;
			border: 1px solid #eee;
			margin-top: 2.5em;
			border-radius: 0 0 10px 10px;
		}
		
		.tab-group section {
			opacity: 0;
			height: 0;
			padding: 0 1em;
			overflow: hidden;
			transition: opacity 0.4s ease, height 0.4s ease;
		}
		
		.tab-group section.active {
			opacity: 1;
			height: auto;
			overflow: visible;
		}
		
		.tab-nav {
			list-style: none;
			margin: -2.5em -1px 0 0;
			padding: 0;
			height: 2.5em;
			overflow: hidden;
		}
		
		.tab-nav li {
			display: inline;
		}
		
		.tab-nav li a {
			top: 1px;
			position: relative;
			display: block;
			float: left;
			border-radius: 10px 10px 0 0;
			background: #eee;
			line-height: 2em;
			padding: 0 1em;
			text-decoration: none;
			color: grey;
			margin-top: .5em;
			margin-right: 1px;
			transition: background .2s ease, line-height .2s ease, margin .2s ease;
		}
		
		.tab-nav li.active a {
			background: #399cde;
			color: white;
			line-height: 2.5em;
			margin-top: 0;
		}
		
		.nav li {
			display: inline-block;
		}
		
		/* 页面样式 */
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
		/* #content #infolistTab{
			width: 80%;
		} */
		#content .tabheader{
			display: flex;
			justify-content: space-between;
			margin: 20px 0;
		}
		#content .tabheader button{
			color: #fff;
			background-color: #399cde;
			font-size: 14px;
			font-weight: 400;
			text-align: center;
			padding: 1px 15px;
			cursor: pointer;
			border-radius: 4px;
		}
		#content .tabheader button:hover{
			background-color: #337ab7;
		}
	</style>
</head>
<body>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getAbsentStuFromPlace(#session.examLocationId)" var="absentStuList" />
	</s:bean>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getCheatingStuFromPlace(#session.examLocationId)" var="cheatingStuList" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<%-- <s:debug/> --%>
	<div id="content">
		<div class="htmleaf-container">
			<div class="container">
				<div class="tab-group">
					<section id="tab1" title="缺考名单">
						<div class="tabheader">
							<h4>缺考名单</h4>
							<button type="button">导&nbsp;&nbsp;出</button>
						</div>
						<div style="margin-bottom: 20px;">
							<table id="absent" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>证件号码</th>
										<th>座位号</th>
										<th>手机号码</th>
									<thead>
									<tbody>
	    								</tbody>
							</table>
						</div>
					</section>
					<section id="tab2" title="黑名单">
						<div class="tabheader">
							<h4>黑名单</h4>
							<button type="button">导&nbsp;&nbsp;出</button>
						</div>
						<div style="margin-bottom: 20px;">
							<table id="cheating" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>证件号码</th>
										<th>座位号</th>
										<th>手机号码</th>
									<thead>
									<tbody>
	    								</tbody>
							</table>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//获取表格中的数据
	/* 缺席名单中的数据 */
	var absentStuArray = new Array();
	var index=0;
	<s:iterator value="#absentStuList">
		var absentStuInfo = new Array(4);
		absentStuInfo[0] = "<s:property value='stuname'/>"
		console.log(absentStuInfo[0]);
		absentStuInfo[1] = "<s:property value='cardid'/>"
		absentStuInfo[2] = <s:property value="examseatnumber"/>	
		absentStuInfo[3] = "<s:property value='phonenumber'/>"
		absentStuArray[index++] = absentStuInfo;
	</s:iterator>
	
	/* 黑名单中的数据 */
	var cheatingStuArray = new Array();
	index=0;
	<s:iterator value="#cheatingStuList">
		var cheatingStuInfo = new Array(4);
		cheatingStuInfo[0] = "<s:property value='stuname'/>"
		console.log(absentStuInfo[0]);
		cheatingStuInfo[1] = "<s:property value='cardid'/>"
		cheatingStuInfo[2] = <s:property value="examseatnumber"/>	
		cheatingStuInfo[3] = "<s:property value='phonenumber'/>"
		cheatingStuArray[index++] = cheatingStuInfo;
	</s:iterator>
	
	
	$("document").ready(function(){
		$(".menu a:eq(1)").css("color","red");
		
		/* 标签页构建 */
		$('.tab-group').tabify();
		
		/*缺考名单表格设定*/
		$("#absent").DataTable({
			data: absentStuArray,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "暂无同学缺考",
			"bStateSave": true 
			}
		});
		/*黑名单表格设定*/
		$("#cheating").DataTable({
			data: cheatingStuArray,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "暂无同学作弊",
			"bStateSave": true 
			}
		});
	});
</script>
</html>