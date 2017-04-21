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
<style type="text/css">

.changeHeadPicture{
height: 150px;
width:150px;
}
#changePictureForm{
 padding-left:250px;
 padding-top:50px;
}
</style>
</head>
<body style="padding: 20px;">
	
	
	        <div style="float: left;margin-left: 30px;" >
			 原头像： <br>
			 <img src="${user.getImgUrl()}"   class="changeHeadPicture" />
			</div>
			<div  id="newPictureDiv" style="margin-left: 250px;">
			新头像：<br>
					<img id="divPreviewId"  class="changeHeadPicture" >
			</div>
	
	 <div id="changePictureDiv">
	     <form id="changePictureForm"  method="post"  enctype="multipart/form-data" >
            <div >
 					<input id="imgInput"  type="file"  onchange="previewImage(this,'divPreviewId');" />
		    </div>
	 
 			<div>
				<button type="button" onclick="changePicture()" class="btn btn-primary">
	              <i class="icon-upload-alt"  ></i>保存
				</button>
				&nbsp;&nbsp;
				<button type="button" onclick="$('#pictureModal').modal('hide');" class="btn btn-primary cancelBtn" >
					<i class="icon-remove icon-white"></i>取消
				</button>
			</div>
 		</form>
	</div> 		
	 
	 
</body>
</html>
