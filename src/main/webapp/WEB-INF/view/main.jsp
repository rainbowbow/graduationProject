<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>系统主界面1</title>
<s:include value="/common/include_easyui.jsp"></s:include>

<style> 
.west{
  width:200px;
  padding:10px;
}
.footer{text-align:center;color:#15428B; margin:0px; padding:0px;line-height:23px; font-weight:bold;}  
</style>
 
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
    <div data-options="region:'north',split:true,border:false"  
    		style="overflow: hidden; height: 30px;
        		   background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
                   line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 【${sessionScope.userBean.truename}】 
        	<a href="<%=path%>/loginOutAction" id="loginOut">安全退出</a>
        </span>
        <span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> XXX系统</span>
    </div>
	<div data-options="region:'west',title:'系统菜单'" class="west" style="padding: 0px;margin: 0px;">
	  <ul id="tree"></ul>
	</div>

	<div data-options="region:'center'">
	  <div class="easyui-tabs" fit="true" border="false" id="tabs" tabWidth="120" >	      
			<div title="首页" style="padding:20px;overflow:hidden;" id="home">
				
			<h1>Welcome to using The jQuery EasyUI!</h1>
			
			</div>	      
	  </div>
	</div>
    <div data-options="region:'south',split:true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By DFRZ Email:bjhxl@59ibox.cn</div>
    </div>
  
	<div id=mm class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>  
<script> 
// addTab('邮件', '/e_mailAction!list?remark=0, null)
$.messager.show({
	title:'我的消息',
	msg:'<a href="javascript:void(0);"   onclick="">未读邮件</a>',
	timeout:5000,
	showType:'slide'
   });
   
  

$(function(){  
	$("#tree").tree({
		url:			"<%=path%>/mainAction!leftTreeMenu?date="+new Date()+"",
		lines:			true, 
		onClick:function (node) {
			var isleaf 			= node.isleaf;
			var menu_href 		= node.menu_href;
			if (isleaf == 1){
				addTab(node.text, menu_href, null);
			}
	}});
	
	
      
	function addTab(subtitle, url, icon) {
		if (!$("#tabs").tabs("exists", subtitle)) {
			$("#tabs").tabs("add", {
					title:			subtitle, 
					content:		"<iframe scrolling=\"auto\" frameborder=\"0\"  src=\"" + url + "\" style=\"width:100%;height:100%;\"></iframe>", 
					closable:		true, 
					icon:			icon
			});
		} else {
			$("#tabs").tabs("select", subtitle);
		}
		tabClose();
	}
	function tabClose() {
		/*双击关闭TAB选项卡*/
		$(".tabs-inner").dblclick(function () {
			var subtitle = $(this).children(".tabs-closable").text();
			$("#tabs").tabs("close", subtitle);
		});
		/*为选项卡绑定右键*/
		$(".tabs-inner").bind("contextmenu", function (e) {
			$("#mm").menu("show", {left:e.pageX, top:e.pageY});
			var subtitle = $(this).children(".tabs-closable").text();
			$("#mm").data("currtab", subtitle);
			$("#tabs").tabs("select", subtitle);
			return false;
		});
	}
	//绑定右键菜单事件
	
	
		//关闭当前
	$("#mm-tabclose").click(function () {
		var currtab_title = $("#mm").data("currtab");
		$("#tabs").tabs("close", currtab_title);
	});
		//全部关闭
	$("#mm-tabcloseall").click(function () {
		$(".tabs-inner span").each(function (i, n) {
			var t = $(n).text();
			if (t != "\u9996\u9875") {
				$("#tabs").tabs("close", t);
			}
		});
	});
		//关闭除当前之外的TAB
	$("#mm-tabcloseother").click(function () {
		var currtab_title = $("#mm").data("currtab");
		$(".tabs-inner span").each(function (i, n) {
			var t = $(n).text();
			if (t != "\u9996\u9875") {
				if (t != currtab_title) {
					$("#tabs").tabs("close", t);
				}
			}
		});
	});
		//关闭当前右侧的TAB
	$("#mm-tabcloseright").click(function () {
		var nextall = $(".tabs-selected").nextAll();
		if (nextall.length == 0) {
				//msgShow('系统提示','后边没有啦~~','error');
			alert("\u540e\u8fb9\u6ca1\u6709\u5566~~");
			return false;
		}
		nextall.each(function (i, n) {
			var t = $("a:eq(0) span", $(n)).text();
			if (t != "\u9996\u9875") {
				$("#tabs").tabs("close", t);
			}
		});
		return false;
	});
		//关闭当前左侧的TAB
	$("#mm-tabcloseleft").click(function () {
		var prevall = $(".tabs-selected").prevAll();
		if (prevall.length == 0) {
			alert("\u5230\u5934\u4e86\uff0c\u524d\u8fb9\u6ca1\u6709\u5566~~");
			return false;
		}
		prevall.each(function (i, n) {
			var t = $("a:eq(0) span", $(n)).text();
			if (t != "\u9996\u9875") {
				$("#tabs").tabs("close", t);
			}
		});
		return false;
	});
	
		//退出
	$("#mm-exit").click(function () {
		$("#mm").menu("hide");
	});

});
</script>
</body>
</html>