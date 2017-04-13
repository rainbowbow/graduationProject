package com.rainbow.controller;

 import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rainbow.beans.Product;
import com.rainbow.beans.User;
import com.rainbow.service.ProductService;
 
@Controller
public class ProductController {

	  //Logger log=LoggerFactory.getLogger(getClass());
	  
	  @Resource
	  ProductService productService;
	  
	  @RequestMapping("product")
		public ModelAndView product(){
			ModelAndView model = new ModelAndView("product/product");
			return model;
		}
	  @RequestMapping("repertory")
		public ModelAndView repertory(){
			ModelAndView model = new ModelAndView("product/repertory");
			return model;
		}
	
	  
	  
		@RequestMapping("ProductController/productlist")
		@ResponseBody
		public List<Product> ShopProduct(HttpServletRequest request){
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			System.out.println(num+"\nnum");
			String productName = request.getParameter("productName");
			String startMoney = request.getParameter("startMoney");
			String endMoney = request.getParameter("endMoney");
 			List<Product> productList=new ArrayList<Product>();
			productList=productService.ShopProduct(productName,startMoney,endMoney,num,num+10);
			return productList;
		}
		@RequestMapping("ProductController/repertoryList")
		@ResponseBody
		public List<Product> RepertoryList(HttpServletRequest request){
			String productName = request.getParameter("productName");
			String type = request.getParameter("type");
			System.out.println(productName+"bbbbbbb"+type); 			
 			List<Product> repertoryList=new ArrayList<Product>();
 			repertoryList=productService.RepertoryList(productName,type);
			
 			System.out.println(repertoryList.get(0).getImgUrl()+"\n\nooo\n"); 
 			return repertoryList;
		}
		@RequestMapping("ProductController/addProduct")
		@ResponseBody
		int addProduct(Product product){
			/*
			String productName = request.getParameter("productName");
			int count = Integer.parseInt(request.getParameter("count"));
			Double price = Double.parseDouble(request.getParameter("price"));
			String detail=request.getParameter("detail");*/
			int addId=productService.AddProduct(product);
 			return addId;
		}
		
		
		@RequestMapping("ProductController/updateProduct")
		@ResponseBody
		int updateProduct(Product product){
			
			/*int  productId = Integer.parseInt(request.getParameter("productId"));
			String productName = request.getParameter("productName");
			int count = Integer.parseInt(request.getParameter("count"));
			Double price = Double.parseDouble(request.getParameter("price"));
			String detail=request.getParameter("detail");*/
 			int updateId=productService.UpdateProduct(product);
      		System.out.println(updateId+"aaaaaqqaaaaaa");
       		return updateId;
		}
		
		
		@RequestMapping("ProductController/delProduct")
		@ResponseBody
		int delProduct(Model model,HttpServletRequest request){	
			
			String productIdMore = request.getParameter("productId");
			return productService.DelProduct(productIdMore);
			
		}
		 
		@RequestMapping("ProductController/upOrDownShopProduct")
		@ResponseBody
		int upOrDownShopProduct(HttpServletRequest request){
			
			int productId = Integer.parseInt(request.getParameter("productId"));
			int type = Integer.parseInt(request.getParameter("type"));
			//1:在售商品--》修改shop_card表的type为1
   			int upShopId=productService.upOrDownShopProduct(productId,type);
   			return upShopId;
		}
		
	 
  }