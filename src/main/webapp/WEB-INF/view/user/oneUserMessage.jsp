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
					<i class="icon-th-list"></i>
					用户管理					
				</h1>
	 
				<div class="right-content">
				<div class="panel-body" style="padding-bottom:0px;">
					  
 
               <div id="toolbar" class="btn-group">
		            <input type="button" class="btn btn-primary" value="新增"  data-toggle="modal"  data-target="#add"  href="user"/>
                </div>
                <div>
				 <table  data-search="true" class="table table-bordered" id="messageTable">
				 </table>
				 </div>
				</div>
			</div> <!-- /span9 -->
			
	      </div> <!-- /row -->
		
	 </div> <!-- /container -->
	
    </div> <!-- /content -->
 <!-- 新增 Modal start -->
	<div class="modal hide fade" id="addModal" tabindex="-1" role="dialog">
		<div class="modal-body">
			<jsp:include page="../product/addProduct.jsp"></jsp:include>
		</div>
	</div>
	<!-- 新增 Modal end -->
		
<jsp:include page="../include/footer.jsp"></jsp:include>
   <script >
  
    $(document).ready(function(){
    var li=document.getElementById('oneUserMessage-active');
    li.setAttribute("class","active");
    var path="${ctx}"+"/UserController/oneUserMessage";
    $('#messageTable').bootstrapTable({
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
              field: 'userId',
              title: '序号'
          }, {
              field: 'userName',
              title: '名称'
          }, {
              field: 'sex',
              title: '性别'
          }, {
              field: 'age',
              title: '年龄'
          },{
              field: 'phone',
              title: '电话'
          }, {
              field: 'address',
              title: '地址'
          }, {
              field: 'eMail',
              title: 'e-mail'
          },
          {
              field: 'type',
              title: '状态'
          },
          {
              title: '操作',
              field: 'doSomething',
              align: 'center',
              formatter:function(value,row,index){  
            	 
            	 var t;
            	 if(row.type=="12"){
            		 t = '<a href="#" mce_href="#" onclick="shop(\''+row.userId+ '\')">拉白</a> ';
            	 }else{
            		 t = '<a href="#" mce_href="#" onclick="shop(\''+row.userId+ '\')">拉黑</a> ';
            	 }
            	
                 var e = '<a href="#" mce_href="#" onclick="shop(\''+ row.userId + '\')">详情</a> ';  

                return t+e;  
            }}
      ]
      });
    
    });
     
  
    </script>
	</body>
</html>
