<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">

	</head>

	<body>

				 <form id="editForm"  method="post" class="form-horizontal" novalidate="novalidate">
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
						     <select name="sex" id = "sex" style="height: 25px;width:210px;"> 
						      <option value="0" selected>女生0</option> 
						      <option value="1" >男生1</option> 
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
								<input style="height: 25px;width:210px;" type="text" name="eMail" id="eMail" >
							
							</div>
						</div>
				      <div class="control-group">
							<label class="control-label">地址:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="address" id="address"  >
							
							</div>
						</div>
						 
					</form>
			
    </div> <!-- /content -->
 <!-- 新增 Modal start -->
	<div class="modal hide fade" id="addModal" tabindex="-1" role="dialog">
		
		<div class="modal-body">
			<jsp:include page="../product/addProduct.jsp"></jsp:include>
		</div>
	</div>
	<!-- 新增 Modal end -->
	   <script >
  
   
    
    </script>
	</body>
</html>
