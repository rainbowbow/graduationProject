<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>农产品销售系统</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    
    <link href="resources/css/font-awesome.css" rel="stylesheet" />
    
    <link href="resources/css/adminia.css" rel="stylesheet" /> 
    <link href="resources/css/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="resources/css/pages/login.css" rel="stylesheet" /> 

	
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
  <script type="text/javascript" src="${ctx}/resources/js/jquery-2.1.4.min.js"></script>


    <script src="${ctx}/resources/js/bootstrap.js"></script>
    <script type="text/javascript">
		var message = "${message}"
		    if ("no" == message) {
		    	$.messager.alert("警告", "无此用户");
		    }else if ("error" == message) {
		    	$.messager.alert("警告", "密码错误");
		    }
		function login(){
			alert("h");
			$('#loginForm').submit();
			alert("h2h");
		}	

	</script>  
    </head>
<body>

<div id="login-container">
	
	<div id="login-header">
		
		<h3>农产品销售平台</h3>
		
	</div>  
	
	<div id="login-content" class="clearfix">
	
	<form class="form-inline" method="post" id="loginForm" action="loginIn" >
	
                       <div class="form-group">
                            <input class="form-control" type="text" name="userName" id="userName"  placeholder="用户名">
                        </div>
                        
                        <div class="form-group" >
                            <input class="form-control" type="password" name="Password" id="Password" placeholder="密码">
                        </div>
				 
				         <label> <input class="radio-inline" id="identify" name="RadioList" type="radio" value="user" checked/>用户 </label>             
                         <label> <input class="radio-inline" id="identify" name="RadioList" type="radio" value="admin" />管理员 </label>
                       
				        <div class="login-a">
				          <a  class="btn btn-warning btn-large" onclick="login()">登陆</a>
				        </div>  
		
		
		            <div class="end-a">
			          <label>   <a href="javascript:;">忘记密码？点这里</a></label> 
			          <label>   <a href="forgot_password.html">还没注册？马上注册</a> </label> 
		            </div>  
</form></div> 
  </body>
</html>
