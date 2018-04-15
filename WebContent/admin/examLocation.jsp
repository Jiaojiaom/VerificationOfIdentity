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
		#content #elheader span{
			color: red;
		}
		#content #elheader #import{
			margin-right: 30px;
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
				<button type="button" id="import">导入</button>
				<button type="button">新增</button>
			</div>
		</div>
		<table id="elMsg" class="display" cellspacing="0" width="100%">
			<thead>
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
		var elInfo = new Array(4);
		elInfo[0] = "<s:property value='building'/></a>";
		elInfo[1] = "<s:property value='classroom'/>";
		elInfo[2] = "<s:property value='containnumber'/>";
		elInfo[3] = "<button class='btn btn-info'>编辑</button>&nbsp;&nbsp;<button class='btn btn-danger'>删除</button>";
		elArray[index++] = elInfo;
	</s:iterator>
	
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
		
	});
</script>
</html>