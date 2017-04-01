<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/header.jsp"></jsp:include>
<title>农产品销售系统</title>

</head>

<body>

	<jsp:include page="../include/top.jsp"></jsp:include>

	<div id="content">

		<div class="container">

			<div class="row">
				<c:choose>
					<c:when test="${user.getType()=='0'}">
						<jsp:include page="../include/admin_menu.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="../include/user_menu.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>

				<div class="span9">

					<h1 class="page-title">
						<i class="icon-th-list"></i> 用户管理
					</h1>

					<div class="right-content">
							<div class="panel panel-default">
								<div class="panel-heading" >查询条件</div>
								<div class="panel-body">
								
								<form class="form-inline" role="form">
									<div class="form-group">
									    <label  for="userName">名称</label> 
										<input style="height: 25px"  class="form-control" name="userName" id="userName" placeholder="Enter userName">
									    <select id="sex" name="sex" class="form-control" >
													<option value="" >请选择</option>
													<option value="0" >女生</option>
													<option value="1">男生</option>
													
												</select>
										<button type="button" style="margin-right: 20px"
											id="btn_query" onclick="searchUser();" class="btn btn-primary">查询</button>
								   
									</div>
								 	
									</form>
									
								</div>
							</div>

							<div id="toolbar" class="btn-group">
								<input type="button" class="btn btn-primary" value="新增"
									data-toggle="modal" data-target="#add" href="user" />
							</div>
							<div>
								<table data-search="true" class="table table-bordered"
									id="messageTable">
								</table>
							</div>
						</div>
					</div>
					<!-- /span9 -->

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /content -->

  <!-- 新增 Modal start -->
	<div class="modal hide fade" id="addModal" tabindex="-1" role="dialog">
		<div class="modal-body">
			<jsp:include page="../product/addProduct.jsp"></jsp:include>
		</div>
	</div>
	<!-- 新增 Modal end -->
	
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script>
			$(document).ready(
							function() {
								var li = document.getElementById('user-active');
								li.setAttribute("class", "active");
								var path = "${ctx}"+ "/UserController/userlist";
								$('#messageTable').bootstrapTable(
												{
													url : path,
													dataType : "json",
												    method: 'post', //请求方式（*）
												    contentType: "application/x-www-form-urlencoded",
                                                    toolbar : '#toolbar', //工具按钮用哪个容器
													striped : true,
													cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
													sortable : true, //是否启用排序
													sortOrder : "asc", //排序方式
													showRefresh : true,//刷新功能  
													search : true,//搜索功能 
												  	queryParamsType: "limit", //参数格式,发送标准的RESTFul类型的参数请求  
													queryParams: function (params) {
													    return {
													            rows: this.pageSize,
													            page: this.pageNumber,
													            userName:$("input[name='userName']").val(),
													            sex:$("#sex").val()
													        };
													    },
													singleSelect : false,
													pagination : true, //分页
													paginationPreText: "上一页",
												    paginationNextText: "下一页",
													pageNumber : 1,
													clickToSelect : true,
													pageSize : 10, //每页的记录行数（*）
													pageList : [ 10, 25, 50,100 ], //可供选择的每页的行数（*）
													sidePagination : "client", //客户端处理分页
												    formatNoMatches: function () {  //没有匹配的结果
														    return '无符合条件的记录';
														  },
													columns : [
															{
																field : 'userId',
																title : '序号'
															},
															{
																field : 'userName',
																title : '名称'
															},
															{
																field : 'sex',
																title : '性别',
																formatter:function(value, row,index){
																	if(value=="0"){
																		return '<p style="color:pink" >女生</>';
																    }else{
																    	return '<p style="color:gray" >男生</>';
																    }
																}
															},
															{
																field : 'age',
																title : '年龄'
															},
															{
																field : 'phone',
																title : '电话'
															},
															{
																field : 'address',
																title : '地址'
															},
															{
																field : 'eMail',
																title : 'e-mail'
															},
															{
																field : 'type',
																title : '状态',
																formatter:function(value, row,index){
																	if(value=="11"){
																		return '<p style="color:gray" >正常用户</>';
																    }else if(value=="0"){
																    	return '<p style="color:blue" >管理员</>';
																    }else{return '<p style="color:red" >拉黑中</>';}
																}
															},
															{
																title : '操作',
																field : 'doSomething',
																align : 'center',
																formatter : function(value,row,index) {
																	var e = '<a href="#" mce_href="#" onclick="shop(\''
																		+ row.userId
																		+ '\')">详情</a> ';

																	var t;
																	if (row.type == "12") {
																		t = '<a href="#"  onclick="shop(\''
																				+ row.userId
																				+ '\')">拉白</a> ';
																	} else if(row.type == "11"){
																		t = '<a href="#" onclick="shop(\''
																				+ row.userId
																				+ '\')">拉黑</a> ';
																	}else{
																		return e;
																	}

																	return t+ e;
																}
															} ]
												});

							});

		 
		
			    function searchUser(){
			    	var searchUrl="${ctx}"+ "/UserController/userlist";
			    	//alert(searchUrl);
 			    	$('#messageTable').bootstrapTable('refresh', {url: searchUrl});  
			    	}
		</script>
</body>
</html>
