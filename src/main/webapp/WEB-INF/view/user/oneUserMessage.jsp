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
					个人信息管理					
				</h1>
	 
				<div class="right-content">
				
				 <form id="oneMessageForm"  method="post" class="form-horizontal" novalidate="novalidate">
						<div class="control-group">
							<label class="control-label">用户Id:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="userId" id="userId" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户名:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="userName" id="userName" >
							</div>
						</div>
			
						
						<div class = "control-group"> 
						     <label class="control-label" for = "sex">性别</label> 
						     <div class="controls">
						     <select id = "sex" style="height: 25px;width:210px;"> 
						      <option value="0" selected>女生0</option> 
						      <option value="1">男生1</option> 
						     </select> 
						     </div>
						 </div> 
						 
						<div class="control-group">
							<label class="control-label">年龄</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="age" id="age" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">电话:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="phone" id="phone" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
							
							</div>
						</div>
						 
						<div class="control-group">
							<label class="control-label">E-mail</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="count" id="editCount" >
							
							</div>
						</div>
				      <div class="control-group">
							<label class="control-label">地址:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="count" id="editCount"  >
							
							</div>
						</div>
						<div class="form-actions" style="padding-left: 170px;">
				
							<button type="button" onclick="shopCard()" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>保存
							</button>
							&nbsp;&nbsp;
							<button type="button" onclick="$('#editModal').modal('hide');" class="btn btn-primary cancelBtn" >
								<i class="icon-remove icon-white"></i>取消
							</button>
						</div>
					</form>
			</div>  
			
	      </div> <!-- /span9 -->
		
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
    
    });
     
  
    </script>
	</body>
</html>
