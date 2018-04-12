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
	<link rel="stylesheet" type="text/css" href="../lib/table.css">
	<script type="text/javascript" language="javascript" src="../lib/prefixfree.min.js"></script>
	<script src="../lib/modal.js"></script>
	<%-- <sx:head/> --%>
	<style type="text/css">
		body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	height: 100vh;
	width: 100%;
}

.main {
	display: flex;
	flex-direction: column;
	width: 90%;
	margin-left: 2%;
	padding: 10px;
}

.main table {
	width: 98%;
}

.nav {
	margin-top: 50px;
	line-height: 40px;
	font-size: 10px;
	align-self: flex-start;
	margin-left: 2%;
}

.formTeacher {
	display: flex;
	flex-direction: row;
}

.clearfix:after, .container:after, .tab-nav:after {
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
	background: #6EB590;
	color: white;
	line-height: 2.5em;
	margin-top: 0;
}

.nav li {
	display: inline-block;
}

input[type="file"] {
	display: inline-block;
	width: 134px;
}

.exportInfo {
	margin: 20px 0 10px 10px;
}
.fileForm {
	padding:10px;
	margin:10px 0;
	border:1px solid #eee;
	box-shadow:1px 1px 5px #eee;
}
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
.fileName {
	background-color: transparent;
    border: 0;
}
@media screen and (max-width: 685px) {
	.fileName {
		width: 60%;
	}
    .importFileBtn {
        margin-top: 15px;
    }
    .exportInfo {
    	margin-top: 0;
    }
}
	</style>
</head>
<body>
	<div id="content">
		<div class="htmleaf-container">
			<div class="container">
				<div class="tab-group">
					<section id="tab1" title="系列表">
						<h3>系列表</h3>
						<p>
						<div id="deptListForm">
							<form action="uploadFile" method="post" name="formDept" id="formDept"  onsubmit="return validate(formDept)"
							enctype="multipart/form-data"  onsubmit="console.log('1');" class="fileForm pull-left">
							     导入系信息： 
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importDeptFile" onchange="importDeptFileFun()"/>
								</a>
								<input class="fileName" id="deptFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="dept" id="deptid"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
							    <button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addDeptModal">添加系</button>
								<button class="btn btn-info exportInfo"
									onClick="window.location.href='exportData?datatype=dept'">导出系</button>
							</div>
							<table id="dept" class="display" cellspacing="0" width="100%">
								<thead>
									<th>系编号</th>
									<th>系名</th>
									<th>编辑系</th>
									<!-- <th>删除</th> -->
							</table>
						</div>
						</p>
					</section>
					<section id="tab2" title="班级列表">
						<h3>班级列表</h3>
						<p>
						<div id="classListForm">
							<form action="uploadFile" method="post" name="formClass" id="formClass"
							enctype="multipart/form-data"  onsubmit="return validate(formClass)" class="fileForm pull-left">
							     导入班级信息： 
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importClassFile" onchange="importClassFileFun()"/>
								</a>
								<input class="fileName" id="classFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="class"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
							    <button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addClassModal">添加班级</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=class'">导出班级</button>
							</div>
							<table id="class" class="display" cellspacing="0" width="100%">
								<thead>
									<th>班级编号</th>
									<th>班级名</th>
									<th>编辑班级</th>
									<!-- <th>删除</th> -->
							</table>
						</div>
						</p>
					</section>
					<section id="tab3" title="教师列表">
						<h3>教师列表</h3>
						<p>
						<div id="teacherListForm">
							<form action="uploadFile" method="post" name="formTeacher" id="formTeacher"
							enctype="multipart/form-data" onsubmit="return validate(formTeacher)" class="fileForm pull-left">
							     导入教师信息：
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importTeacherFile" onchange="importTeacherFileFun()"/>
								</a>
								<input class="fileName" id="teacherFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="teacher"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
						    	<button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addTeacherModal">添加教师</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=teacher'">导出教师</button>
						    </div>
							<table id="teacher" class="display" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>工号</th>
										<th>姓名</th>
										<th>系名</th>
										<th>性别</th>
										<th>职称</th>
										<th>已选/限选人数</th>
										<th>是否具有反选资格</th>
										<th>详情</th>
										<!-- <th>删除</th> -->
									</tr>
								</thead>
							</table>
						</div>
						</p>
					</section>
					<section id="tab4" title="学生列表">
						<h3>学生列表</h3>
						<p>
						<div id="studentListForm">
							<form action="uploadFile" method="post" name="formStudent" id="formStudent"
							enctype="multipart/form-data" onsubmit="return validate(formStudent)" class="fileForm pull-left">
							   导入学生信息：
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importStudentFile" onchange="importStudentFileFun()"/>
								</a>
								<input class="fileName" id="studentFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="student"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
						    	<button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addStudentModal">添加学生</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=student'">导出学生</button>
						    </div>

							<table id="student" class="display" cellspacing="0" width="100%">
								<thead>
									<th>学号</th>
									<th>姓名</th>
									<th>系名</th>
									<th>班级</th>
									<th>性别</th>
									<th>绩点</th>
									<th>导师</th>
									<th>状态</th>
									<th>修改</th>
									<th>删除</th>
							</table>
						</div>
						</p>
					</section>
					<section id="tab5" title="未选择导师">
						<div class="non-tutor-title" style="display: flex; justify-content: space-between">
							<h3>未选择导师的学生列表</h3>
							<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=UnSelectStudent'">导出未选择导师学生</button>
						</div>
						<p>
						<div id="classListForm">
							<table id="UnSelectedStudent" class="display" cellspacing="0" width="100%">
								<thead>
									<th>学号</th>
									<th>姓名</th>
									<th>系名</th>
									<th>班级</th>
									<th>性别</th>
									<th>绩点</th>
									<th>电话</th>
							</table>
						</div>
						</p>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
/* var activateTab = function(id) {
	console.log("1");
    $(".tab-nav li").filter('.active').removeClass('active');
    $("section").filter('.active').removeClass('active');
    $(".tab-nav li").has('a[href="' + id + '"]').addClass('active');
    $("section").filter(id).addClass('active');
  } */
$(function(){
	$('.tab-group').tabify();
})
</script>
</html>