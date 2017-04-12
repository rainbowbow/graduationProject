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
	<form id="addForm" method="post" class="form-horizontal" novalidate="novalidate">
		<div class="control-group">
			<label class="control-label">收件人:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="addressName">
			</div>
		</div>
		 
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="addressPhone">
			</div>
		</div>
		<div  data-toggle="distpicker">
		  <select id="province" data-province="---- 选择省 ----"></select>
		  <select id="city" data-city="---- 选择市 ----"></select>
		  <select id="district" data-district="---- 选择区 ----"></select>
		</div>
		
		<div class="control-group">
			<label class="control-label">详细街道:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="detail">
			</div>
		</div>
		
		<div class="form-actions" style="padding-left: 135px;">
			 
			<button type="button" onclick="addAddress();"  class="btn btn-primary">
				<i class="icon-ok icon-white"></i>保存
			</button>
			&nbsp;&nbsp;
			<button type="button"  onclick="$('#addModal').modal('hide');" class="btn btn-primary cancelBtn">
				<i class="icon-remove icon-white"></i>取消
			</button>
		</div>
	</form>
	 <script >
	 
	 function addAddress() { 
		 var p=$("#province").val();
		 var c=$("#city").val();
		 var d=$("#district").val();
		 var address=p+c+d;
 		    $.ajax({  
		        type: "post",  
		        url:  "${ctx}" + "/UserController/addAddress?address="+address,
		        data:$('#addForm').serialize(),
		        
		        success : function(data) {
					if (data > 0) {
						alert('添加成功:' + data);
						location.reload();
					} else {
						alert('添加失败' + data);
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
