<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
		<jsp:include page="include/header.jsp"></jsp:include>
		<title>Admin</title>

	</head>

	<body>
	
	<jsp:include page="include/top.jsp"></jsp:include>
	
	<div id="content">
	
	  <div class="container">
		
	    	<div class="row">
		        <jsp:include page="include/admin_menu.jsp"></jsp:include>
		         <div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-list"></i>
					产品管理					
				</h1>
	 
				<div class="right-content">
				<div id="toolbar" class="btn-group">
		            <button id="btn_add" type="button" onclick="addProduct()" class="btn btn-default">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		            </button>
                </div>
                <div>
				 <table  data-search="true" class="table table-bordered" id="productTable">
				 </table>
				 </div>
				</div>
			</div> <!-- /span9 -->
			
	      </div> <!-- /row -->
		
	 </div> <!-- /container -->
	
    </div> <!-- /content -->
  <div id="add_dialog_div"></div>
<jsp:include page="include/footer.jsp"></jsp:include>
   <script >
    
    $(document).ready(function(){
    var li=document.getElementById('product-active');
    li.setAttribute("class","active");
    var path="${ctx}"+"/ProductService/productlist";
    $('#productTable').bootstrapTable({
    url: path, 
    dataType: "json",
    toolbar: '#toolbar',                //工具按钮用哪个容器
    striped: true, 
    cache: false,   //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
    sortable: true,   //是否启用排序
    sortOrder: "asc",   //排序方式
    showRefresh: true,//刷新功能  
    search: true,//搜索功能 
    singleSelect: false,
    pagination: true, //分页
    pageNumber:1, 
    clickToSelect: true,
    pageSize: 10,                       //每页的记录行数（*）
    pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
    sidePagination: "client", //客户端处理分页
          columns: [{
              field: 'productId',
              title: '序号'
          }, {
              field: 'productName',
              title: '产品名称'
          }, {
              field: 'price',
              title: '价格'
          }, {
              field: 'count',
              title: '可拍数量'
          },
          {
              title: '操作',
              field: 'productId',
              align: 'center',
              formatter:function(value,row,index){  
                   var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
                   var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
                return e+d;  
            }}
      ]
      });
    });
    
    function addProduct(){
    	alert("pp");
    	var addURL ="${ctx}"+"/roleAction";
		jQuery('#add_dialog_div').dialog({    
			title: 			"添加角色",  
			width: 			800,  
			height: 		390,  
			closed: 		false,  
			modal: 			true, 
			minimizable: 	false, //是否可最小化，默认false
			maximizable: 	false, //是否可最大化，默认false
			resizable: 		false, 
			cache: 			false,  
			content:		"<iframe name='roleFrame' id='roleFrame' scrolling='no' frameborder='0' style=\"width:100%;height:99%;\" src='"+addURL+"'></iframe>" 
		}); 
    }
    </script>
	</body>
</html>
