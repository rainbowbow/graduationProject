<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<body style="padding: 20px;">
<input type="hidden" name="testList" id="testList" />
	<table data-search="true"  class="table table-bordered"
								id="shopCardPayListTable">
							</table>
	<script>
	$(document).ready(function() {
		var shopCardPayIdList=$("#testList").val();
		alert(shopCardPayIdList);
		var shopCardPayIdList2 = document.getElementById('testList');
		alert(shopCardPayIdList2);
		var path = "${ctx}"+ "/ShopCardController/shopCardList";
		$('#shopCardPayListTable').bootstrapTable(
						{
							url : path,
							dataType : "json",
							toolbar : '#toolbar', //工具按钮用哪个容器
							striped : true,
							cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							sortable : true, //是否启用排序
							sortOrder : "asc", //排序方式
							showRefresh : true,//刷新功能  
							search : true,//搜索功能 
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
										field : 'shopCardId',
										title : '序号'
									},{
										field : 'productName',
										title : '产品名称'
									},{
										field : 'price',
										title : '价格'
									},{
										field : 'count',
										title : '数量'
									},{
										field : 'type',
										title : '状态',
										formatter:function(value, row,index){
											if(value=="1"){
												return '<p style="color:black" >可购买</>';
										    }else{
										    	return '<p style="color:gray" >已失效</>';
										    }
										}
									},{
										title : '操作',
										field : 'doSomething',
										align : 'center',
										formatter : function(value, row,index) {
	                                                          var e = '<a href="#" onclick="editInfo(\''
													+ row.productId+'\'\,\''
													+ row.productName+'\'\,\''
													+ row.price+'\'\,\''
													+ row.count+
											'\')">编辑</a> ';
											
												var d = '<a href="#"  onclick="del(\''
													+ row.productId
													+ '\')">删除</a> ';
											return  e+ d;
										}
									} ]
						});
	          });
	
	//提交购物车
	function shopCard(){  
	      var shopCount=parseInt($("#shopCount").val());
	      if(shopCount<=0){
	    	  alert("数量有误！请重新选择！");
	    	  return false;
	      }else{
	    $.ajax({  
	        type: "post",  
	        url:  "${ctx}" + "/ShopCardController/addShopCard",
	        data:$('#shopForm').serialize(),
	        
	        success : function(data) {
				if (data > 0) {
					alert('操作成功:' + data);
					location.reload();
				} else {
					alert('操作失败' + data);
				}
			},
	        error : function() {
				alert('请求出错');
				location.reload();
			}
	    }); 
	    return false;} 
	    
	}  
			
	</script>
</body>
</html>
