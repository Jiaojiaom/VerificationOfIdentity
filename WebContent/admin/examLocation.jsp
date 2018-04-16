<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>考场管理页面</title>
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../lib/jquery-tab.js"></script>
	<link rel="stylesheet" type="text/css" href="../lib/jquery.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="../lib/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../lib/table.css">
	<script type="text/javascript" language="javascript" src="../lib/jquery.form.js"></script>
	<style type="text/css">
		body{
			font-size: 14px;
			font-family: "微软雅黑";
		}
		#content{
			margin-top: 50px;
			width: 80%;
			padding: 3em;
			/* display: flex;
			justify-content: center; */
		}
		#content #elheader{
			display: flex;
			justify-content: space-between;
			width: 100%;
			margin-bottom: 2em;
		}
		#content #elheader h5 span{
			color: red;
		}
		#content #elheader>div{
			display: flex;
		}
		#content #elheader button{
			color: #fff;
			background-color: #399cde;
			font-size: 14px;
			font-weight: 400;
			text-align: center;
			padding: 1px 15px;
			cursor: pointer;
			border-radius: 4px;
			height: 35px;
		}
		input[type="file"] {
			display: inline-block;
			width: 134px;
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
		.filename{
			width: 50px;
		}
	</style>
</head>
<body>
	<s:bean name="db.ExamDisMsgDAO">
		<s:set value="getElMsg(#parameters.tpid)" var="elList" />
	</s:bean>
	<s:include value="navbar.jsp"></s:include>
	<div id="content">
		<div id="elheader">
			<h5>>考场管理&nbsp;&nbsp;&nbsp;<span>当前考点：<s:property value="#parameters.tpname"/></span></h5>
			<div>
				<!-- <button type="button" id="import">导入</button> -->
				 <form method="post" name="formEl" id="formEl" enctype="multipart/form-data" >
				     导入考场信息： 
					<a href="javascript:;" class="file">选择文件
					    <input type="file" name="excel" id="importFile" onchange="loadFile(this.files[0])"/>
					</a>
					<span id="filename" style="vertical-align: middle">未选择文件</span>
					<input type="hidden" name="importType" value="examLocation"/>
					<input type="hidden" name="tpId" value="<s:property value='#parameters.tpid'/>" />
					<!-- <input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/>  -->
					<!-- <button id="filebtn" type="button">导&nbsp;入</button> -->
					<button id="filebtn" type="submit">导&nbsp;入</button>
			    </form>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button">新增</button>
			</div>
		</div>
		<table id="elMsg" class="display" cellspacing="0" width="100%">
			<thead>
				<th>考场号</th>
				<th>考场名称</th>
				<th>考场教室</th>
				<th>可容纳学生数</th>
				<th>操作</th>
			<thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
	//获取表格中的数据
	/* 考场数据 */
	var elArray = new Array();
	var index=0;
	<s:iterator value="#elList">
		var elInfo = new Array(5);
		elInfo[0] = "<s:property value='disid'/></a>";
		elInfo[1] = "<s:property value='building'/></a>";
		elInfo[2] = "<s:property value='classroom'/>";
		elInfo[3] = "<s:property value='containnumber'/>";
		elInfo[4] = "<button class='btn btn-info'>编辑</button>&nbsp;&nbsp;<button class='btn btn-danger'>删除</button>";
		elArray[index++] = elInfo;
	</s:iterator>
	
	//加载上传文件名
	function loadFile(file){
	    $("#filename").html(file.name);
	}
	
	$("document").ready(function(){
		$(".menu a:eq(1)").css("color","red");
		
		/*考场表格设定*/
		$("#elMsg").DataTable({
			data: elArray,
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
			"sZeroRecords": "暂无该考场考点信息",
			"bStateSave": true 
			}
		});
		
		$("#filebtn").click(function(){
			$("#formEl").ajaxForm({
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
	});
</script>
</html>