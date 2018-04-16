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
	<script type="text/javascript" language="javascript" src="../lib/jquery.form.js"></script>
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
			margin-top: 50px;
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
			align-items: center;
		}
		#content .tabheader button{
			color: #fff;
			background-color: #399cde;
			font-size: 14px;
			font-weight: 400;
			text-align: center;
			padding: 6px 15px;
			cursor: pointer;
			border-radius: 4px;
		}
		#content .tabheader button:hover{
			background-color: #337ab7;
		}
		/* #content .tabheader>div{
			display: flex;
		} */
		/* #content .tabheader button{
			height: 100%;
		} */
		#content .tabheader #teaButton{
			display: flex;
			align-items: center;
		}
		input[type="file"] {
			display: inline-block;
			width: 134px;
		}
		/* fileForm {
			padding:10px;
			margin:10px 0;
			border:1px solid #eee;
			box-shadow:1px 1px 5px #eee;
		} */
		#content .tabheader>div{
			display: flex;
		}
		/* #content .tabheader #teaButton form{
			padding:10px;
			margin-right: 30px;
			border:1px solid #eee;
			box-shadow:1px 1px 5px #eee;
		} */
		.file {
		    position: relative;
		    display: inline-block;
		    background: #fff;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    padding: 6px 12px;
		    overflow: hidden;
		    color: #333;
		    text-decoration: none;
		    text-indent: 0;
		    line-height: 20px;
		    margin-bottom: -13px;
		    cursor: pointer;
		}
		.file input {
		    position: absolute;
		    right: 0;
		    top: 0;
		    opacity: 0;
		}
		.file:hover {
		    background: #e6e6e6;
		    border-color: #adadad;
		    color: #333;
		    text-decoration: none;
		}
		.filename{
			width: 50px;
		}
		/* .fileName {
			background-color: transparent;
		    border: 0;
		} */
		</style>
</head>
<body>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getStuMsgForAdmin()" var="stuList" />
	</s:bean>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getAbStuMsgForAdmin()" var="absentStuList" />
	</s:bean>
	<s:bean name="db.StudentMsgDAO">
		<s:set value="getCheatingStuMsgForAdmin()" var="cheatingStuList" />
	</s:bean>
	<s:bean name="db.TeacherMsgDAO">
		<s:set value="getTeaMsgForAdmin()" var="teaList" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div class="htmleaf-container">
			<div class="container">
				<div class="tab-group">
					<section id="tab1" title="考生名单">
						<div class="tabheader">
							<h4>考生名单</h4>
							<form name="exportStu" id="exportStu" method="post" action="exportExcel.action">
								<input type="hidden" name="exportType" value="candidate"/>
								<button type="submit" id="exportStu">导&nbsp;&nbsp;出</button>
							</form>
						</div>
						<div style="margin-bottom: 20px;">
							<table id="stuMsg" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>证件号码</th>
										<th>学校名称</th>
										<th>电子邮箱</th>
										<th>手机号码</th>
									<thead>
									<tbody>
	    								</tbody>
							</table>
						</div>
					</section>
					<section id="tab2" title="教师名单">
						<div class="tabheader">
							<div>
								<h4>教师名单&nbsp;&nbsp;&nbsp;&nbsp;</h4>
							 	<button type="button">新&nbsp;增</button>&nbsp;
							</div>
						<!-- 	<div id="teaButton"> -->
								<%-- <div class="file-container" style="position:relative;overflow: hidden;vertical-align:middle">
							        <form enctype="multipart/form-data" id ="importForm" method="post">
								        <button class="fileinput-button" id="filebtn" type="button">上传</button>
								        <input type="file" id="teaFile" name="excel" onchange="loadFile(this.files[0])" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
								    		<span id="filename" style="vertical-align: middle"></span>
							        </form>
							    </div> --%>
							    <form method="post" name="formTea" id="formTea" enctype="multipart/form-data" >
								     导入教师名单： 
									<a href="javascript:;" class="file">选择文件
									    <input type="file" name="excel" id="importFile" onchange="loadFile(this.files[0])"/>
									</a>
									<span id="filename" style="vertical-align: middle">未选择文件</span>
									<input type="hidden" name="importType" value="tea"/>
									<!-- <input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/>  -->
									<!-- <button id="filebtn" type="button">导&nbsp;入</button> -->
									<button id="filebtn" type="submit">导&nbsp;入</button>
							    </form>
								<!-- <button type="button">新&nbsp;&nbsp;增</button>&nbsp; -->
							<!-- </div> -->
						</div>
						<div style="margin-bottom: 20px;">
							<table id="teaMsg" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>工号</th>
										<th>学校</th>
										<th>手机号码</th>
										<th>考点</th>
									<thead>
									<tbody>
	    								</tbody>
							</table>
						</div>
					</section>
					<section id="tab3" title="缺考名单">
						<div class="tabheader">
							<h4>缺考名单</h4>
							<form name="exportAbStu" id="exportAbStu" method="post" action="exportExcel.action">
								<input type="hidden" name="exportType" value="absentStu"/>
								<button type="submit">导&nbsp;&nbsp;出</button>
							</form>
						</div>
						<div style="margin-bottom: 20px;">
							<table id="absent" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>证件号码</th>
										<th>学校名称</th>
										<th>电子邮箱</th>
										<th>手机号码</th>
									<thead>
									<tbody>
	    								</tbody>
							</table>
						</div>
					</section>
					<section id="tab4" title="黑名单">
						<div class="tabheader">
							<h4>黑名单</h4>
							<form name="exportCheatStu" id="exportCheatStu" method="post" action="exportExcel.action">
								<input type="hidden" name="exportType" value="cheatingStu"/>
								<button type="submit">导&nbsp;&nbsp;出</button>
							</form>
						</div>
						<div style="margin-bottom: 20px;">
							<table id="cheating" class="display" cellspacing="0" width="100%">
									<thead>
										<th>姓名</th>
										<th>证件号码</th>
										<th>学校名称</th>
										<th>电子邮箱</th>
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
	/* 考生名单中的数据 */
	var stuArray = new Array();
	var index=0;
	<s:iterator value="#stuList">
		var stuInfo = new Array(5);
		stuInfo[0] = "<s:property value='stuname'/>";
		stuInfo[1] = "<s:property value='cardid'/>";
		stuInfo[2] = "<s:property value='collegename'/>";
		stuInfo[3] = "<s:property value='email'/>";
		stuInfo[4] = "<s:property value='phonenumber'/>";
		stuArray[index++] = stuInfo;
	</s:iterator>
	
	/* 教师名单中的数据 */
	var teaArray = new Array();
	var index=0;
	<s:iterator value="#teaList">
		var teaInfo = new Array(5);
		teaInfo[0] = "<s:property value='teaname'/>";
		teaInfo[1] = "<s:property value='teaid'/>";
		teaInfo[2] = "<s:property value='collegename'/>";
		teaInfo[3] = "<s:property value='phonenumber'/>";
		teaInfo[4] = "<s:property value='testingpointname'/>";
		teaArray[index++] = teaInfo;
	</s:iterator>
	
	/* 缺席名单中的数据 */
	var absentStuArray = new Array();
	var index=0;
	<s:iterator value="#absentStuList">
		var absentStuInfo = new Array(5);
		absentStuInfo[0] = "<s:property value='stuname'/>";
		absentStuInfo[1] = "<s:property value='cardid'/>";
		absentStuInfo[2] = "<s:property value='collegename'/>";
		absentStuInfo[3] = "<s:property value='email'/>";
		absentStuInfo[4] = "<s:property value='phonenumber'/>";
		absentStuArray[index++] = absentStuInfo;
	</s:iterator>
	
	/* 黑名单中的数据 */
	var cheatingStuArray = new Array();
	index=0;
	<s:iterator value="#cheatingStuList">
		var cheatingStuInfo = new Array(5);
		cheatingStuInfo[0] = "<s:property value='stuname'/>";
		cheatingStuInfo[1] = "<s:property value='cardid'/>";
		cheatingStuInfo[2] = "<s:property value='collegename'/>";
		cheatingStuInfo[3] = "<s:property value='email'/>";
		cheatingStuInfo[4] = "<s:property value='phonenumber'/>";
		cheatingStuArray[index++] = cheatingStuInfo;
	</s:iterator>
	
	//加载上传文件名
	function loadFile(file){
	    $("#filename").html(file.name);
	}
	
	$("document").ready(function(){
		$(".menu a:eq(0)").css("color","red");
		
		/* 标签页构建 */
		$('.tab-group').tabify();
		
		/*考生名单表格设定*/
		$("#stuMsg").DataTable({
			data: stuArray,
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
			"sZeroRecords": "暂无考生信息",
			"bStateSave": true 
			}
		});
		
		/*教师名单表格设定*/
		$("#teaMsg").DataTable({
			data: teaArray,
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
			"sZeroRecords": "暂无教师信息",
			"bStateSave": true 
			}
		});
		
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
		
		$("#filebtn").click(function(){
			$("#formTea").ajaxForm({
				url :"msgImport.action",
				dataType : "json",
				type : "post",
				resetForm : true,
				beforeSubmit : function(){
					var fileName= $("#importFile").val();
					if(fileName==undefined || fileName==""){
						alert("请选择文件！");
					}else{
			            var suffix=(fileName.substr(fileName.lastIndexOf(".")+1)).toUpperCase();
			            if(!(suffix=='XLS'||suffix=='XLSX')){
			                alert("只能上传xls或者xlxs类型的文件！");
			                return false;
			            }
					}
				},
				success : function(data){
					alert(data);
					window.location.reload();
					
				},
				error : function(data){
					alert(data);
				}
			});
		});
		
		//考生名单导出
		/* $("#exportStu").click(function(){
			$.ajax({
				type: "POST",
				url: "exportExcel.action",
				data: {exportType: "candidate"},
				complete: function(){
					alert("complete");
				}
			});
		}); */
	});
</script>
</html>