<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard - Bootstrap Admin</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
     
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/css/pages/login.css" rel="stylesheet" /> 
    <link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="resources/css/font-awesome.css" rel="stylesheet" />
    
    <link href="resources/css/adminia.css" rel="stylesheet" /> 
    <link href="resources/css/adminia-responsive.css" rel="stylesheet" /> 
    
    <script type="text/javascript" src="${ctx}/resources/js/jquery-2.1.4.min.js"></script>


    <script src="./js/bootstrap.js"></script>

<body>
<div id="login-container">
	
	<div id="login-header">
		
		<h3>农产品销售平台</h3>
		
	</div> 
	
	<div id="login-content" class="clearfix">
	
	<form method="post" id="loginForm" action="loginIn" class="bootstrap-admin-login-form" >
                    
                        <h1>Login</h1>
                        
                        <div class="form-group">
                            <input class="form-control" type="text" name="userName" id="userName"  placeholder="用户名">
                        </div>
                        
                        <div class="form-group" >
                            <input class="form-control" type="password" name="Password" id="Password" placeholder="密码">
                        </div>
                       
                       
                        <label> <input id="identify" name="RadioList" type="radio" value="user" checked/>用户 </label>             
                        <label> <input id="identify" name="RadioList" type="radio" value="admin" />管理员 </label>
                      
                        
                        <a  class="btn btn-lg btn-primary btn-block" onclick="login()">登陆</a>
                    </form>
		
  </body>
</html>
