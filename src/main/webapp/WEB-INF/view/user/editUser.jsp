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

				 <form id="updateForm"  method="post" class="form-horizontal" novalidate="novalidate">
						<div class="control-group">
							<label class="control-label">用户Id:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="userId"  id="userIdEdit" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户名:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="userName" id="userNameEdit" >
							</div>
						</div>
			
						
						<div class = "control-group"> 
						     <label class="control-label" for = "sex">性别</label> 
						     <div class="controls">
						     <select name="sex" id = "sexEdit" style="height: 25px;width:210px;"> 
						      <option value="0" >女生0</option> 
						      <option value="1" >男生1</option> 
						     </select> 
						     </div>
						 </div> 
						 
						<div class="control-group">
							<label class="control-label">年龄</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="age" id="ageEdit"  >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">电话:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="phone" id="phoneEdit"  >
							
							</div>
						</div>
						 
						<div class="control-group">
							<label class="control-label">E-mail</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="eMail" id="eMailEdit" >
							
							</div>
						</div>
				      <div class="control-group">
							<label class="control-label">地址:</label>
							<div class="controls">
								<input style="height: 25px;width:210px;" type="text" name="address" id="addressEdit"  >
							
							</div>
						</div>
						 
						 <div class="form-actions" style="padding-left: 170px;">

			<button type="button" onclick="updateProduct()" class="btn btn-primary">
				<i class="icon-ok icon-white"></i>保存
			</button>
			&nbsp;&nbsp;
			<button type="button" onclick="$('#editUser').modal('hide');" class="btn btn-primary cancelBtn" >
				<i class="icon-remove icon-white"></i>取消
			</button>
		</div>
		
					</form>
	<script>
	//提交更改  
	function updateProduct() {  
	      
	    $.ajax({  
	        type: "post",  
	        url:  "${ctx}" + "/UserController/updateUser",
	        data:$('#updateForm').serialize(),
	        
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
	    return false;
	}  
			
	</script>
  
	</body>
</html>
