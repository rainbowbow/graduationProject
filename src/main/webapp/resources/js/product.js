//sort:第几页（1开始）
//页数 sort-1(0开始)
//totalCount:总页数
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
	 	  document.getElementById("sort").innerText="1";
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
	 		  alert("已是最后一页！");
	 		  return false;
	 	  }
	 	  document.getElementById("sort").innerText=totalCount+1;
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
		  document.getElementById("sort").innerText=num;

		  $("#num").val(num-1); 
		  ajaxFuction();
   }
   function nextPage(){
	  var  totalCount=parseInt($("#totalCount").val());
 	  var num= parseInt($("#num").val());
 	 document.getElementById("sort").innerText=num+2;
 	  if(num>=totalCount){
 		  alert("已是最后一页！");
 		  return false;
 	  }
	  $("#num").val(num+1);//向input加1
	  ajaxFuction();
  }
  
 

   
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
	        		 document.getElementById("sort").innerText="1";
	        		shopProduct(data);
	        	}
   	        },
  	        error : function() {
  				alert('请求出错');
  				location.reload();
  			}
  	    });
    	}
    
    
	$("#addShopCount").click(function(){
 		var n=$(this).prev().val();
		if(parseInt(n)>=parseInt($("#maxShopCount").val())){
			$("#addShopCount").attr("class","classSpan");
 			return false;
		}
		$("#decreaseShopCount").removeClass("classSpan");
		$("#addShopCount").removeClass("classSpan");
		var num=parseInt(n)+1;
		$(this).prev().val(num);
		});
	
	
	//减的效果
	$("#decreaseShopCount").click(function(){
	var n=$(this).next().val();
	if(parseInt(n)<=1){
		$("#decreaseShopCount").attr("class","classSpan");
		return false;
	}
	$("#addShopCount").removeClass("classSpan");
	$("#decreaseShopCount").removeClass("classSpan");
	var num=parseInt(n)-1;
	$(this).next().val(num);
	});
	
	
	
	//减的效果
	$("#decreaseCount").click(function(){
	var n=$(this).next().val();
	if(parseInt(n)<=1){
		$("#decreaseCount").attr("class","classSpan");
		return false;
	}
	$("#addCount").removeClass("classSpan");
	$("#decreaseCount").removeClass("classSpan");
	var num=parseInt(n)-1;
	$(this).next().val(num);
	});
	
	
	$("#addCount").click(function(){
 		var n=$(this).prev().val();
		if(parseInt(n)>=parseInt($("#maxDetailCount").val())){
			$("#addCount").attr("class","classSpan");
 			return false;
		}
		$("#decreaseCount").removeClass("classSpan");
		$("#addCount").removeClass("classSpan");
		var num=parseInt(n)+1;
		$(this).prev().val(num);
		});
	
	
	
	
    
    function closeModal(){
		 $("#detailCount").val("1");
		 $("#shopCount").val("1");
		 $("#addCount").removeClass("classSpan");
		 $("#decreaseCount").removeClass("classSpan");
		 $("#decreaseShopCount").removeClass("classSpan");
		 $("#addShopCount").removeClass("classSpan");
	}