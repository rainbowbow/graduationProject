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
						<i class="icon-th-list"></i> 订单管理
					</h1>

					<div class="right-content">
                         <div class="panel panel-default">
								<div class="panel-heading" >查询条件</div>
								<div class="panel-body">
								
								<form class="form-inline" role="form">
									<div class="form-group">
									    <label  for="productName">产品名称</label> 
										<input style="height: 25px"  class="form-control" name="productName" id="productName" placeholder="Enter productName">
									    
									    
							<c:choose>
								<c:when test="${user.getType()=='0'}">
									<label  for="userName">用户名称</label> 
									<input style="height: 25px"  class="form-control" name="userName" id="userName" placeholder="Enter userName">
												   
								</c:when>
								
							</c:choose>
				
				
									    
									    <label  for="orderTime">时间</label> 
										<input style="height: 25px"  class="dateSearch" name="orderTime" id="orderTime" placeholder="Enter orderTime">
									    
										<button type="button" style="margin-right: 20px"
											id="btn_query" onclick="searchProductRecord();" class="btn btn-primary">查询</button>
								   
									</div>
								 	
									</form>
									
								</div>
							</div>
							<div id="toolbar" class="btn-group">
								 
									<input type="button" class="btn btn-primary" value="删除" onclick="delMore()" />
							</div>
							<div >
							<table data-search="true"  class="table table-bordered"
								id="orderTable">
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
	<!-- 新增 Modal start -->
	<div class="modal hide fade" id="recordDetail" tabindex="-1" role="dialog">
		<div class="modal-header">
			<button class="close" type="button" data-dismiss="modal">×</button>
			<h3>用户详情</h3>
		</div>
		<div class="modal-body">
			<jsp:include page="recordDetail.jsp"></jsp:include>
		</div>
	</div>
 	<!-- 新增 Modal end -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script>
	 $(".dateSearch").datetimepicker({
		 format: "yyyy-mm-dd",
		 autoclose: true,//当选择一个日期之后是否立即关闭此日期时间选择器
		 todayBtn: true,//日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期
		 todayHighlight: true,//如果为true, 高亮当前日期
		 pickerPosition: "bottom-right",
		 language: 'zh-CN',//中文，需要引用zh-CN.js包
		 endDate:new Date(),
		 startView: 2,//日期时间选择器打开之后首先显示的视图。 可接受的值：2==月视图
		 minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
		 });
	 
		$(document).ready(
			function() {
				var li = document.getElementById('order-active');
				li.setAttribute("class", "active");
				var path = "${ctx}"
						+ "/ProductRecordController/productRecordList";
				$('#orderTable').bootstrapTable({
				url : path,
				dataType : "json",
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
				            productName:$("input[name='productName']").val()
				        };
				    },
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
							field : 'orderId',
							title : '序号'
						},
						{
							field : 'productName',
							title : '产品名称'
						},
						{
							field : 'userName',
							title : '买家'
						},
						{
							field : 'price',
							title : '价格'
						},
						{
							field : 'count',
							title : '数量'
						},
						{
							field : 'orderTime',
							title : '购买时间',
						},{
							field : 'totalMoney',
							title : '总价',
						},
						{
							title : '操作',
							field : 'doSomething',
							align : 'center',
							formatter : function(value, row,index) {
								var e = '<a href="#" onclick="detailInfo(\''
									+ row.orderId+'\'\,\''
									+ row.productName+'\'\,\''
									+ row.userName+'\'\,\''
									+ row.price+'\'\,\''
									+ row.count+'\'\,\''
									+ row.orderTime+'\'\,\''
									+ row.totalMoney+
							'\')">详情</a> ';
								
									var d = '<a href="#"  onclick="del(\''
										+ row.orderId
										+ '\')">删除</a> ';
								return e+ d;
							}
						} ]
			});
				
				$('#orderTable').bootstrapTable('hideColumn', 'orderId');
    });

		  function searchProductRecord(){
			    var orderTime=$("#orderTime").val();
			    var searchUrl="${ctx}"+ "/ProductRecordController/productRecordList?orderTime="+orderTime;
 		    	$('#orderTable').bootstrapTable('refresh', {url: searchUrl});  
		    	}
		  
		function del(id) {
			
			if (!id) {
				alert('Error！');
				return false;
			}
			// var form_data = new Array();

			$.ajax({
				url : "${ctx}" + "/ProductRecordController/delProductRecord",
				data : {"orderId" : id},
				type : "post",
				beforeSend : function() {
					if (window.confirm('你确定要删除吗？')) {
						//alert("确定");
						return true;
					} else {
						//alert("取消");
						return false;
					}
				},
				success : function(data) {
					if (data!=null) {
						alert('操作成功:' + data);

						// document.location.href='world_system_notice.php'
						location.reload();
					} else {
						alert('操作失败' + data);
					}
				},
				error : function() {
					alert('请求出错');
				},
				complete : function() {
					// $('#tips').hide();
				}
			});

			return false;
		}
		
		function delMore() {
			var row=$.map($('#orderTable').bootstrapTable('getSelections'), function (row) {
		        return row.orderId;
		    });
			if(row.length>0){

				$.ajax({
					url : "${ctx}" + "/ProductRecordController/delProductRecord?orderId="+row,
					data : {"orderId" : row},
					type : "post",
					beforeSend : function() {
						if (window.confirm('你确定要删除吗？')) {
							//alert("确定");
							return true;
						} else {
							alert(row)
							//alert("取消");
							return false;
						}
					},
					success : function(data) {
						if (data > 0) {
							alert('操作成功:' + data);

							// document.location.href='world_system_notice.php'
							location.reload();
						} else {
							alert('操作失败' + data);
						}
					},
					error : function() {
						alert('请求出错');
					},
				});
			}else{ 
				alert("请至少选择一条数据");
				return false;
		   }
		}
		
		   
	</script>
</body>
</html>
