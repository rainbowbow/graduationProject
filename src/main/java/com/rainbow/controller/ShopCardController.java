package com.rainbow.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;
import com.rainbow.beans.User;
import com.rainbow.service.ProductRecordService;
import com.rainbow.service.ProductService;
import com.rainbow.service.ShopCardService;
 
@Controller
public class ShopCardController {

	  //Logger log=LoggerFactory.getLogger(getClass());
	  
	  @Resource
	  ShopCardService shopCardService;//注入名为shopCardService的bean
	 
	  @Resource
	  ProductRecordService productRecordService;
	   
	  @Resource
	  ProductService productService;
	  
	  @RequestMapping("shopCardList")
		public ModelAndView product(){
			ModelAndView model = new ModelAndView("shopCard/shopCardList");
			return model;
		}
	  
		@RequestMapping("ShopCardController/shopCardList")
		@ResponseBody
		public List<ShopCard> shopCardList(HttpSession session){
			
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			List<ShopCard> shopCardList=new ArrayList<ShopCard>();
 			shopCardList=shopCardService.ShopCardList(userId);
			return shopCardList;
		}
		
		
		@RequestMapping("ShopCardController/shopCardListSelective")
		@ResponseBody
		public List<ShopCard> shopCardListSelective(HttpSession session,HttpServletRequest request){
			
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			String shopCardIdMore =request.getParameter("shopCardIdMore");
			
			String[] shopCardId = shopCardIdMore.split(",");
			System.out.println(shopCardIdMore.toString());
            int num=0;
			
			List<ShopCard> shopCardList=new ArrayList<ShopCard>();
			ShopCard shopCard;
			System.out.println(shopCardId+"hhhh");
  			    for(int i=0;i<shopCardId.length;i++){
  			    	shopCard= shopCardService.shopcardById(Integer.parseInt(shopCardId[i]));
  			    	System.out.println("i:"+i+"==>"+shopCard);
  			    	shopCardList.add(shopCard);
  			    	num++;
  			    }
			return shopCardList;
		}
		
		
		
		@RequestMapping("ShopCardController/payBill")
		@ResponseBody
		int addProductRecord(Model model,HttpServletRequest request,HttpSession session){
			
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			String userName=user.getUserName();
			String shopCardIdMore =request.getParameter("shopCardId");
			//获取要结算的购物车id，通过这个id获取productId,count
			//ShopCard shopCard=shopCardService.shopcardById(shopCardId);
			//通过productId获取产品的productName,price
			 
			//购买 总价=数量*价格
			//购买成功则--》1：删除对应的购物车    2：添加对应的订单
			
			String[] shopCardId = shopCardIdMore.split(",");
			System.out.println(shopCardId.toString());
            int num=0;
            ProductRecord productRecord=new ProductRecord();
            productRecord.setUserId(userId);
            productRecord.setUserName(userName);
            
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            Date date = new Date();  
            productRecord.setOrderTime(sdf.format(date));
            
            //获取要结算的购物车id，通过这个id获取productId,count
			for (int i = 0; i < shopCardId.length; i++) {
			 
			}
 			System.out.println(shopCardId+"qqqqqqww"+userId);
 			
			
		 
 			return num;
		}
		@RequestMapping("ShopCardController/addShopCard")
		@ResponseBody
		 public int addShopCard(HttpServletRequest request,HttpSession session){
			   
			    User user=(User) session.getAttribute("user");
				String userId=user.getUserId();
				int productId =Integer.parseInt(request.getParameter("productId"));
				int count =Integer.parseInt(request.getParameter("count"));
		    	int num=shopCardService.isShopCard(userId, productId);
		    	System.out.println(userId+"\nproductId"+productId+"\ncount"+count);
		    	System.out.println("\n"+"num: "+num);
				if(num>0){
					return shopCardService.saveShopCard(productId, userId, count);
		    	}else{
			       return shopCardService.addShopCard(productId, userId, count);

		    	}
		    }
		@RequestMapping("ShopCardController/editShopCard")
		@ResponseBody
		 public int editShopCard(HttpServletRequest request,HttpSession session){
			   
			     
				int shopCardId =Integer.parseInt(request.getParameter("shopCardId"));
				int count =Integer.parseInt(request.getParameter("count"));

		    	System.out.println("\n"+"num: "+shopCardId);
		    	System.out.println();
		    	return shopCardService.updateShopCard(shopCardId,count); 
		    }
		
		
		@RequestMapping("ShopCardController/delShopCard")
		@ResponseBody
		int delShopCard(Model model,HttpServletRequest request){	
			
			String shopCardIdMore = request.getParameter("shopCardId");
			System.out.println("kkkkkkkkkk====>"+shopCardIdMore);
			return shopCardService.DelShopCard(shopCardIdMore);
		}
		
	 
  }