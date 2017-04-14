<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
		<jsp:include page="include/header.jsp"></jsp:include>
		<title>农产品销售系统</title>
<style type="text/css">

 
.tabContent li {
	float: left;
	margin-right: -1px;
	margin-bottom: 60px;
	position: relative;
	border: 1px solid #e4e4e4;
	margin-left: 50px;
	border: 1px
} 

.tabContent img {
	width: 100px;
	height: 100px;
	display: block;
}
 .price {
	line-height: 30px;
	color: #c4161c;
	font-size: 14px;
	font-weight: bold;
}
 
</style>
	</head>

	<body>
	
	<jsp:include page="include/top.jsp"></jsp:include>
	
	<div id="content">
	
	  <div class="container">
		
	    	<div class="row">
		        <jsp:include page="include/user_menu.jsp"></jsp:include>
		         <div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-list"></i>
					购买产品					
				</h1>
	 
				<div class="right-content">
				<div class="panel panel-default">
								<div class="panel-heading" >查询条件</div>
								<div class="panel-body">
								
								<form class="form-inline" role="form">
									<div class="form-group">
									    <label  for="productName">名称</label> 
										<input style="height: 25px"  class="form-control" name="productName" id="productName" placeholder="Enter productName">
									   <label  for="startMoney">价格区间</label> 
										<input style="height: 25px"  class="form-control" name="startMoney" id="startMoney" placeholder="Enter startMoney">
								       —— <input style="height: 25px"  class="form-control" name="endMoney" id="endMoney" placeholder="Enter endMoney">
									   
										<button type="button" style="margin-right: 20px"
											id="btn_query" onclick="searchProduct();" class="btn btn-primary">查询</button>
								   
									</div>
								 	
									</form>
									
								</div>
							</div>
                 <div class="pre-scrollable">
				   <div id="productDiv">
						 <input type="hidden" id="num" value="0">
						 <input type="hidden" id="totalCount" >  
				  </div>
				 
				 </div>
				 <div>
				 
						 
	    			总共<a id="all" href="#" ></a> 页&nbsp;&nbsp;当前第<a id="order" href="#" ></a>页&nbsp;&nbsp;
	    			    <a  href="#" onclick="firstPage();">首页</a>&nbsp;
	    				<a href="#" onclick="upPage();">上页</a>&nbsp;
	    			    <a href="#" onclick="nextPage();">下页</a>&nbsp;
	    				<a href="#" onclick="lastestPage();">尾页</a>&nbsp;
 						 
				  </div>
				</div>
			</div> <!-- /span9 -->
			
	      </div> <!-- /row -->
		
	 </div> <!-- /container -->
	
    </div> <!-- /content -->
  <!-- 加入购物车Modal start -->
	<div class="modal hide fade" id="shopModal" tabindex="-1" role="dialog">
		<div class="modal-header">
			<button class="close" type="button" data-dismiss="modal">×</button>
			<h3>加入购物车</h3>
		</div>
		<div class="modal-body">
			<jsp:include page="shopCard/addShopCard.jsp"></jsp:include>
		</div>
	</div>
	<!-- 加入购物车Modal end -->
	
	 <!--查看大图Modal start -->
	<div class="modal hide fade" id="photoModal" tabindex="-1" role="dialog">
		<div class="modal-header">
			<button class="close" type="button" data-dismiss="modal">×</button>
			<h3>图片</h3>
		</div>
		<div id="divImg" class="modal-body">
 		</div>
	</div>
	<!-- 查看大图Modal end -->
	
<jsp:include page="include/footer.jsp"></jsp:include>
   <script >
   
   function ajaxFuction(){
	  
	      var numstart=$("#num").val();
		  var productName=$("#productName").val();
		  var startMoney=$("#startMoney").val();
		  var endMoney=$("#endMoney").val();
		  
		  var path="${ctx}"+"/ProductController/productlist";
		    $.ajax({  
		        type: "post",
		        dataType:"json",
		        url:  path,
		        data:{
		        	"num" :numstart,
		        	"productName":productName,
		        	"startMoney":startMoney,
		        	"endMoney":endMoney
		        },
		        success : function(data){
		        	shopProduct(data);
		        },
		        error : function() {
					alert('请求出错');
					location.reload();
				}
		    });
   }
   function firstPage(){
	   
	   var  totalCount=parseInt($("#totalCount").val());
	 	  var num= parseInt($("#num").val());
	 	  document.getElementById("order").innerText="1";
	 	  if(num==0){
	 		  alert("已是首页！");
	 		  return false;
	 	  }
		  $("#num").val(0); 
		  ajaxFuction();
   }
   function lastestPage(){
	   var  totalCount=parseInt($("#totalCount").val());
	  
	 	  var num= parseInt($("#num").val());
	 	  if(num==totalCount){
	 		  alert("已是首页！");
	 		  return false;
	 	  }
	 	  document.getElementById("order").innerText=totalCount+1;
		  $("#num").val(totalCount); 
		  ajaxFuction();
   }
   function upPage(){
	   var  totalCount=parseInt($("#totalCount").val());
	 	  var num= parseInt($("#num").val());
	 	  if(num==0){
	 		  alert("已是首页！");
	 		  return false;
	 	  }
		  document.getElementById("order").innerText=num;

		  $("#num").val(num-1); 
		  ajaxFuction();
   }
   function nextPage(){
	  var  totalCount=parseInt($("#totalCount").val());
 	  var num= parseInt($("#num").val());
 	 document.getElementById("order").innerText=num+2;
 	  if(num>=totalCount){
 		  alert("已是最后一页！");
 		  return false;
 	  }
	  $("#num").val(num+1);//向input加1
	  ajaxFuction();
  }
  
  function shopProduct(data) {
	  
 	  var div=document.getElementById("productDiv");
 	  $('#ulId').remove();
 	
 	  var ul=document.createElement('ul');
 	  ul.setAttribute("id", "ulId");
      ul.setAttribute("class", "tabContent");
      var json = eval(data); //数组  
      var totalCount= $("#totalCount").val();
         
      $("#totalyCount").val(num+1); 
       $.each(json, function (index, item) {  
          //循环获取数据    
          var productId = json[index].productId; 
          var productName = json[index].productName; 
          var price = json[index].price; 
          var count = json[index].count; 
          var imgUrl = json[index].imgUrl; 
			
          var li = document.createElement('li');
          var aDetail = document.createElement('a');
          aDetail.addEventListener("click",function(){
        	  shop(productId,productName,price,count,imgUrl);
          });
          var img = document.createElement("img");
          img.src="${pageContext.request.contextPath}/resources/img/"+imgUrl;
         
          var spanName=document.createElement('span');
          var spanPrice=document.createElement('span');
          spanName.innerHTML="商品："+productName+"<br/>";
         // spanName.appendChild("br/");
          spanPrice.innerHTML="价格："+price+"<br/>";
          spanPrice.setAttribute("class","price");
          
          var aShopCard = document.createElement('a');
          aShopCard.innerText="加入购物车";
          aDetail.appendChild(img);
          li.appendChild(aDetail);
          li.appendChild(spanName);
          li.appendChild(spanPrice);
          li.appendChild(aShopCard);
          ul.appendChild(li);
      });   
      div.appendChild(ul);
	}
  
    $(document).ready(function(){
    var li=document.getElementById('product-active');
    li.setAttribute("class","active");
    var path="${ctx}"+"/ProductController/productlist?num=0";
	    $.ajax({  
	        type: "post",  
	        url:  path,
	        success : function(data){
 	        	if(data.length>0){
 	        		 var totalCount=Math.floor(parseInt(data[0].total)/10);
 	        	     $("#totalCount").val(totalCount);
 	        		 document.getElementById("all").innerText=totalCount+1;
 	        		 document.getElementById("order").innerText="1";
	        		 shopProduct(data);
	        	}
	        },
	        error : function() {
				alert('请求出错');
				location.reload();
			}
	    });  
    });
    function searchProduct(){
      $("#num").val(0);
      var numstart= $("#num").val();//向input加1
      alert(numstart);
      var productName=$("#productName").val();
  	  var startMoney=$("#startMoney").val();
  	  var endMoney=$("#endMoney").val();
  	  
  	  var path="${ctx}"+"/ProductController/productlist";
  	    $.ajax({  
  	        type: "post",
  	        dataType:"json",
  	        url:  path,
  	        data:{
  	        	"num" :numstart,
  	        	"productName":productName,
  	        	"startMoney":startMoney,
  	        	"endMoney":endMoney
  	        },
  	        success : function(data){
  	        	if(data.length>0){
  	        		var totalCount=Math.floor(parseInt(data[0].total)/10);
	        	     $("#totalCount").val(totalCount);
	        		 document.getElementById("all").innerText=totalCount+1;
	        		 document.getElementById("order").innerText="1";
	        		shopProduct(data);
	        	}
   	        },
  	        error : function() {
  				alert('请求出错');
  				location.reload();
  			}
  	    });
    	}
    
    // 回填购物车
	function shop(id,productName,price,count) {  
		//向模态框中传值  
	    $("#shopProductId").val(id);  
		$("#shopProductName").val(productName);  
	    $("#shopPrice").val(price); 
	    $("#maxCount").val(count);
	    
	    $("#shopProductId").prop("readonly","readonly");
	    $("#shopProductName").prop("readonly","readonly");
 	    $("#shopPrice").prop("readonly","readonly");
 	    $("#shopdetail").prop("readonly","readonly");
	    
	    $('#shopModal').modal('show');  
	}  
    
    
	function photo(imgUrl) {  
		//向模态框中传值  
		$("#divImg").empty();
	    var img='<img width="400"  src="${pageContext.request.contextPath}/resources/img/'+imgUrl+'">'
	    $('#divImg').append(img);
	    $('#photoModal').modal('show');  
	    
	}  

    </script>
	</body>
</html>
