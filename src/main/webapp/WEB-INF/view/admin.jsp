<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>				
   
    <jsp:include page="include/header.jsp"></jsp:include>
	<title> Admin</title>
   
</head>
 
</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>


<div id="content">
	
	<div class="container">
		
		<div class="row">
			
		 <jsp:include page="include/menu.jsp"></jsp:include>
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-list"></i>
					产品管理					
				</h1>
				
				<div class="right-content">
					<table id="example1" class="table table-bordered table-striped">
					    <thead>
											<tr>
												<th>商品类型</th>
												<th>商品名称</th>
												<th>净含量</th>
												<th>建议零售价</th>
												<th>原产国</th>
											</tr>
										</thead>
										 
					</table>
				</div>
			</div> <!-- /span9 -->
		
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->

<jsp:include page="include/footer.jsp"></jsp:include>
<script >

$(document).ready(function(){
    alert("rr");
    });
</script>

  </body>
</html>
