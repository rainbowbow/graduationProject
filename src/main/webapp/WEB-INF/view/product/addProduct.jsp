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
			<label class="control-label">产品名称:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="productName">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数量:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="count">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">价格:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="price">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">详情:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="detail">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="profession">选择职业</label>
			<div class="col-sm-2">
				<select id="profession" class="form-control">
					<option>软件工程师</option>
					<option>测试工程师</option>
					<option>硬件工程师</option>
					<option>质量分析师</option>
				</select>
			</div>
		</div>

		<div class="form-actions" style="padding-left: 135px;">
			<button type="button" name="upShop" class="btn btn-primary">马上上架
			</button>
			&nbsp;&nbsp;
			<button type="button" onclick="addProduct();"  class="btn btn-primary">
				<i class="icon-ok icon-white"></i>保存
			</button>
			&nbsp;&nbsp;
			<button type="button"  onclick="$('#addModal').modal('hide');" class="btn btn-primary cancelBtn">
				<i class="icon-remove icon-white"></i>取消
			</button>
		</div>
	</form>
	 <script >
	 
	 function addProduct() { 
		 
		    $.ajax({  
		        type: "post",  
		        url:  "${ctx}" + "/ProductController/addProduct",
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
