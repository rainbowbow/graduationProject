package com.rainbow.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
  			    	shopCardList.add(shopCard);
  			    	num++;
  			    }
  			  System.out.println(shopCardList.get(1).getProductName());
			return shopCardList;
		}
		
		
		
		@RequestMapping("ShopCardController/payBill")
		@ResponseBody
		int addProduct(Model model,HttpServletRequest request,HttpSession session){
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			String shopCardId =request.getParameter("shopCardId");
			//获取要结算的购物车id，通过这个id获取productId和shop数量
			//ShopCard shopCard=shopCardService.shopcardById(shopCardId);
			//通过productId获取产品的可购买数量和类型是否失效，获取价格
			//判断产品是否失效
			//判断购买数量是否大于产品数量   若大于--》操作失败，产品失效或者超过库存
			//若不大于 --》购买 总价=数量*价格
			//购买成功则--》1：删除对应的购物车    2：添加对应的订单
 			int num=1;
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
					return shopCardService.updateShopCard(productId, userId, count);
		    	}else{
			       return shopCardService.addShopCard(productId, userId, count);

		    	}
		    }
	 	
  }