package com.rainbow.controller;

 import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rainbow.beans.Address;
import com.rainbow.beans.Product;
import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;
import com.rainbow.beans.User;
import com.rainbow.service.ProductRecordService;
import com.rainbow.service.ProductService;
import com.rainbow.service.ShopCardService;
import com.rainbow.service.UserService;
  
@Controller
public class ProductRecordController {

	  //Logger log=LoggerFactory.getLogger(getClass());
	  
	  @Resource
	  ProductRecordService productRecordService;
	  @Resource
	  UserService userService;
	  @Resource
	  ProductService productService;
	  
	  @Resource
	  ShopCardService shopCardService;
	  
	  @RequestMapping("product_record")
		public ModelAndView product(){
			ModelAndView model = new ModelAndView("productRecord/product_record");
			return model;
		}
	  
	  
		@RequestMapping("ProductRecordController/productRecordList")
		@ResponseBody
		public List<ProductRecord> ShopProductRecord(HttpServletRequest request,HttpSession session){
			
			String orderTime = request.getParameter("orderTime");
			User user=(User) session.getAttribute("user");
			int userId=Integer.parseInt(user.getUserId());
			String productName = request.getParameter("productName");
			String userName = request.getParameter("userName");
			System.out.println(productName+"bbbbaabbb"+orderTime+"\naaaaaa"); 			
 			List<ProductRecord> recordList=new ArrayList<ProductRecord>();
 			recordList=productRecordService.RecordList(productName,userName,userId,orderTime);
			return recordList;
		}
		@RequestMapping("ProductRecordController/delProductRecord")
		@ResponseBody
		int delProductRecord(Model model,HttpServletRequest request){	
			
			String orderIdMore = request.getParameter("orderId");
			String[] orderId = orderIdMore.split(",");
			System.out.println(orderId.toString());
            int num=0;
			for (int i = 0; i < orderId.length; i++) {
			 if(productRecordService.DelProduct(Integer.parseInt(orderId[i]))!=0){
				 num++;
			 }
			}
			System.out.println(num);
			return num;
		}
		
		
		@RequestMapping("ProductRecordController/addProductRecord")
		@ResponseBody
		int addProductRecord(HttpServletRequest request ,HttpSession session){
			
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			String shopCardIdMore =request.getParameter("shopCardId");
			String addressId =request.getParameter("addressId");

			//根据addressId获取地址信息
            Address address=userService.AddressById(addressId);
            
             List<ShopCard> shopCardList=new ArrayList<ShopCard>();
            //根据shopCardIdMore获取产品价格，名称 产品购买数量
            String[] shopCardId = shopCardIdMore.split(",");
            for(int i=0;i<shopCardId.length;i++){
            	shopCardList.add(shopCardService.shopcardById(Integer.parseInt(shopCardId[i])));
            }
  			 
			 
			//购买 总价=数量*价格
			//购买成功则--》1：删除对应的购物车    2：添加对应的订单
			
			 
            int num=0;
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            Date date = new Date();
            ProductRecord productRecord=new ProductRecord();
            productRecord.setUserId(userId);
            productRecord.setAddress(address.getAddress()+address.getAddressDetail());
            productRecord.setAddressName(address.getAddressName());
            productRecord.setAddressPhone(address.getAddressPhone());
            productRecord.setOrderTime(sdf.format(date));
            
            Map params = new HashMap();
            params.put("productRecord", productRecord);
            params.put("shopCardList", shopCardList);
            int addId= productRecordService.addProductRecord(params);

 			//购买成功则--》1：删除对应的购物车    2：减少对应的产品数量
			if(addId>0){
				shopCardService.DelShopCard(shopCardIdMore);
				productService.UpdateProductCount(shopCardList);
			}
 			return addId;
		}
	 
  }