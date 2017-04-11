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
        <input type="hidden" name="testList" id="testList" />

	     <table class="table table-bordered" id="shopCardPayListTable">
	     </table>
   	     <input class="btn btn-primary" type="button"  value="去支付咯" onclick="payBillEnd()" />
	
	</form>
	<script>
	function payBillEnd() {
	 
		var shopCardId=$("#testList").val();
		alert(shopCardId);
		$.ajax({  
	        type: "post",  
	        url:  "${ctx}" + "/ShopCardController/payBill",
	        data:{"shopCardId":shopCardId},
	        
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
	}
	</script>
</body>
</html>
