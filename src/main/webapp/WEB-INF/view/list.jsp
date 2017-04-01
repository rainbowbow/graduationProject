<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
<base href="<%=basePath%>">
    
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>

<s:include value="/common/include_easyui.jsp"></s:include>
	
<script language="javascript">
	//jQuery的初始化函数
	jQuery(function(){
		var toolArray = [
			{id:"search",			text:"查询数据",		iconCls:"icon-search",		handler:function(){
				searchRole();
			}},
			{id:"select",			text:"选择角色",		iconCls:"icon-tip",			handler:function(){
				checkRole();
			}},
			{id:"addRole",			text:"添加角色",		iconCls:"icon-add",			handler:function(){
				addRole();
			}},
			{id:"edit",				text:"修改角色",		iconCls:"icon-edit",		handler:function(){
				editRole();
			}},
			{id:"delete",			text:"删除角色",		iconCls:"icon-remove",		handler:function(){
				deleteRole();
			}},
			{id:"refresh",			text:"刷新列表",		iconCls:"icon-reload",		handler:function(){
				jQuery("#role_grid_div").datagrid("reload");
				
			}}
		];
		jQuery("#role_grid_div").datagrid({
			rownumbers:		true,
			striped:		true,
			fit:			true,  
			remoteSort:		true,  		//配合字段的属性使用
			pagination:		true,
			pageList:		[10,30,50],
			pageSize:		30,
			toolbar:		toolArray,
			loadMsg:		"正在加载数据，请稍等...",
		    url:			"<%=path%>/roleAction!listGridJson?date="+new Date()+"",    
		    columns:[[    
		    	{field:"ck",				width:50,	checkbox:true},    
		        {field:"role_id",			title:"角色id号",		width:100,	align:"center",		sortable:true},    
		        {field:"role_name",			title:"角色名称",		width:300,	halign:"center",	sortable:true},    
		        {field:"role_remark",		title:"角色备注",		width:200,  align:'left',halign:"center"}    
		    ]]    
		}); 
		
		function deleteRole(){
			var selectArray = jQuery("#role_grid_div").datagrid("getSelections");
			if (selectArray == null || selectArray.length == 0){
				jQuery.messager.alert("操作提示","无法执行该操作，您还未选择数据","error");
			}else{
				var delete_role_id = "";
				for(var i = 0;i<selectArray.length;i++){
					var rowObj = selectArray[i];
					var role_id = rowObj.role_id;
					if (delete_role_id == ""){
						delete_role_id = role_id;
					}else{
						delete_role_id = delete_role_id + "," + role_id;
					}
				}
				var paramObj = {
					"delete_role_id":		delete_role_id
				};
				
				var deleteURL = "<%=path%>/roleAction!deleteRole?date="+new Date()+"";
				
				jQuery.post(deleteURL,paramObj,function(jsonData){
					var flag = 			jsonData.flag;
					var errormsg = 		jsonData.errormsg;
					if (flag == true){
						jQuery.messager.alert("操作提示","数据删除成功","info",function(){
							jQuery("#role_grid_div").datagrid("reload");
						});
					}else{
						jQuery.messager.alert("操作提示","数据删除失败，错误原因:"+errormsg,"error");	
					}
				},"json");
			}
		}
		
		function searchRole(){
			var begin_role_id 	= document.getElementById("begin_role_id").value;
			var end_role_id   	= jQuery("#end_role_id").val();
			var role_name   	= jQuery("#role_name").val();
			var role_remark   	= jQuery("#role_remark").val();
			
			var paramObj = {
				"begin_role_id":			begin_role_id,
				"end_role_id":				end_role_id,
				"role_name":				role_name,
				"role_remark":				role_remark
			};
			jQuery("#role_grid_div").datagrid({
				queryParams: paramObj
			});
		}
		
		function addRole(){
			var addURL = "<%=path%>/roleAction!add?date="+new Date()+"";
			jQuery('#add_dialog_div').dialog({    
				title: 			"添加角色",  
				width: 			800,  
				height: 		390,  
				closed: 		false,  
				modal: 			true, 
				minimizable: 	false, //是否可最小化，默认false
				maximizable: 	false, //是否可最大化，默认false
				resizable: 		false, 
				cache: 			false,  
				content:		"<iframe name='roleFrame' id='roleFrame' scrolling='no' frameborder='0' style=\"width:100%;height:99%;\" src='"+addURL+"'></iframe>" 
			}); 			
		}
		function editRole(){
			var selectArray = jQuery("#role_grid_div").datagrid("getSelections");
			if (selectArray == null || selectArray.length == 0){
				jQuery.messager.alert("操作提示","无法执行该操作，您还未选择数据","error");
			}else{
				if (selectArray.length>1){
					jQuery.messager.alert("操作提示","修改时，只能选择一条记录","error");
					return;
				}
				var selectObj = selectArray[0];
				var role_id = 	selectObj.role_id;
				var editURL = "<%=path%>/roleAction!edit?role_id="+role_id+"&date="+new Date()+"";
				jQuery('#add_dialog_div').dialog({    
					title: 			"修改角色",  
					width: 			800,  
					height: 		390,  
					closed: 		false,  
					modal: 			true, 
					minimizable: 	false, //是否可最小化，默认false
					maximizable: 	false, //是否可最大化，默认false
					resizable: 		false, 
					cache: 			false,  
					content:		"<iframe name='roleFrame' id='roleFrame' scrolling='no' frameborder='0' style=\"width:100%;height:99%;\" src='"+editURL+"'></iframe>" 
				}); 			
			}			
		}	
		function checkRole(){
			
			jQuery("#role_grid_div").datagrid("checkAll");
		}
	});
</script>    
</head>
  
<body class="easyui-layout">   
    <div class="easyui-panel" data-options="region:'north',title:'角色列表'" style="height: 90px;">
    	<table border="0" width="100%"  data-options="fit:true">
    		<tr height="25px;">
    			<td width="10%" align="right">角色ID号：</td>
    			<td width="40%" align="left"><s:textfield name="begin_role_id" id="begin_role_id"/>---<s:textfield name="end_role_id" id="end_role_id"/></td>
    			<td width="10%" align="right">角色名称：</td>
    			<td width="40%" align="left"><s:textfield name="role_name" id="role_name"/></td>
    		</tr>
    		<tr height="25px;">
    			<td align="right">角色备注：</td>
    			<td colspan="3" align="left">
    				<s:textfield name="role_remark" id="role_remark" cssStyle="width:320px;"/>
    			</td>
    			
    		</tr>    		
    	</table>
    </div>     
    <div data-options="region:'center'">
    	<div id="role_grid_div"></div>
    </div>   
	<div id="add_dialog_div"></div>
</body>
</html>
