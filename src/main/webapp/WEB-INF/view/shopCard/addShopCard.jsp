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
	<form id="shopForm"  method="post" class="form-horizontal" novalidate="novalidate">
		<div class="control-group">
			<label class="control-label">产品Id:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="productId" id="shopProductId" >
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品名称:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="productName" id="shopProductName" >
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数量:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="count" id="shopCount" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
	            <input type="text" style="display:none"  id="maxCount"/>
			
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">价格:</label>
			<div class="controls">
				<input style="height: 25px" type="text" name="price" id="shopPrice">
			</div>
		</div>
		 

		<div class="form-actions" style="padding-left: 170px;">

			<button type="button" onclick="shopCard()" class="btn btn-primary">
				<i class="icon-ok icon-white"></i>保存
			</button>
			&nbsp;&nbsp;
			<button type="button" onclick="$('#shopModal').modal('hide');" class="btn btn-primary cancelBtn" >
				<i class="icon-remove icon-white"></i>取消
			</button>
		</div>
	</form>
	<script>
	//提交购物车
	function shopCard(){  
	      var shopCount=$("#shopCount").val();
	      var maxCount=parseInt($("#maxCount").val());
	      if(parseInt(shopCount)>maxCount||parseInt(shopCount)<=0||shopCount==""){
	    	  alert("数量有误！请重新选择11！");
	    	  return false;
	      }
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
	    return false; 
	}		
	</script>
</body>
</html>
