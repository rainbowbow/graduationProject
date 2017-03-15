<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link rel="stylesheet" media="screen" href="resources/css/bootstrap.min.css">
        
        <!-- Bootstrap Admin Theme -->
        <link rel="stylesheet" media="screen" href="resources/css/bootstrap-admin-theme.css">
        <script type="text/javascript" src="${ctx}/resources/js/jquery-2.1.4.min.js"></script>

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
    <body class="bootstrap-admin-without-padding">
        <div class="container">
            <div class="row">
                    <form method="post" id="loginForm" action="loginIn" class="bootstrap-admin-login-form" >
                    
                        <h1>Login</h1>
                        
                        <div class="form-group">
                            <input class="form-control" type="text" name="userName" id="userName"  placeholder="用户名">
                        </div>
                        
                        <div class="form-group" >
                            <input class="form-control" type="password" name="Password" id="Password" placeholder="密码">
                        </div>
                       
                        <div class="form-group">
                        <label> <input id="identify" name="RadioList" type="radio" value="user" checked/>用户 </label>             
                        <label> <input id="identify" name="RadioList" type="radio" value="admin" />管理员 </label>
                        </div>
                        
                        <a  class="btn btn-lg btn-primary btn-block" onclick="login()">登陆</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
