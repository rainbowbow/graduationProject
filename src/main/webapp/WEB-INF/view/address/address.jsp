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
						<i class="icon-th-list"></i> 地址管理
					</h1>

					<div class="right-content">
                         
								 
							<div id="toolbar" class="btn-group">
								 
									<input type="button" class="btn btn-primary" value="删除" onclick="delMore()" />
							</div>
							<div >
							<table  class="table table-bordered" id="addressTable">
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
	
	< 
 	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script>
	
	 
	 
		$(document).ready(
			function() {
				var li = document.getElementById('address-active');
				li.setAttribute("class", "active");
				var path = "${ctx}"
						+ "/UserController/addresslist";
				$('#addressTable').bootstrapTable({
				url : path,
				dataType : "json",
				contentType: "application/x-www-form-urlencoded",
				toolbar : '#toolbar', //工具按钮用哪个容器
				striped : true,
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				sortable : true, //是否启用排序
				sortOrder : "asc", //排序方式
				singleSelect : false,
				pagination : true, //分页
				pageNumber : 1,
				clickToSelect : true,
				pageSize : 7, //每页的记录行数（*）
				pageList : [ 7, 10, 25 ], //可供选择的每页的行数（*）
				sidePagination : "client", //客户端处理分页
				columns : [{
	                        checkbox: true
                        },{  
			                title: '序号',
			                formatter: function (value, row, index) {  
			                    return index+1;  
			                },
			                width:60,
			                align:'center' 
                     },
						{
							field : 'addressId',
							title : '序号'
						}, {
							field : 'userId',
							title : 'user序号'
						},
						{
							field : 'address',
							title : '地址'
						} ,
						{
							title : '操作',
							field : 'doSomething',
							align : 'center',
							formatter : function(value, row,index) {
								var e = '<a href="#" onclick="edit(\''
									+ row.addressId+'\'\,\''
									+ row.address+
							'\')">编辑</a> '; 
								
									var d = '<a href="#"  onclick="del(\''
										+ row.orderId
										+ '\')">删除</a> ';
								return d;
							}
						} ]
			});
				
				$('#orderTable').bootstrapTable('hideColumn', 'addressId');
				$('#orderTable').bootstrapTable('hideColumn', 'userId');
    });
 
	</script>
</body>
</html>
