<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>Home</title>
		<jsp:include page="include/header.jsp"></jsp:include>
		

	</head>

	<body>
		<div class="container-fluid">
			<!-- 导航栏 -->
			<jsp:include page="include/top.jsp"></jsp:include>

			


			<!-- 静态包含 -->
			<%@include file="include/foot.jsp"%>

		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</body>
</html>
