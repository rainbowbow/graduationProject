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
		public List<Product> ShopProduct(){
 			List<Product> productList=new ArrayList<Product>();
			productList=productService.ShopProduct();
			System.out.println(productList.get(0).getProductName());
			return productList;
		}
		@RequestMapping("ProductController/repertoryList")
		@ResponseBody
		public List<Product> RepertoryList(){
 			List<Product> repertoryList=new ArrayList<Product>();
 			repertoryList=productService.RepertoryList();
			System.out.println(repertoryList.get(0).getProductName());
			return repertoryList;
		}
		@RequestMapping("ProductController/addProduct")
		@ResponseBody
		int addProduct(Model model,HttpServletRequest request){
			
			String productName = request.getParameter("productName");
			int count = Integer.parseInt(request.getParameter("count"));
			Double price = Double.parseDouble(request.getParameter("price"));
			String detail=request.getParameter("detail");
			int addId=productService.AddProduct(productName, count, price, detail);
     		model.addAttribute("addId",addId);
 			return addId;
		}
		
		
		@RequestMapping("ProductController/updateProduct")
		@ResponseBody
		int updateProduct(Model model,HttpServletRequest request){
			
			int  productId = Integer.parseInt(request.getParameter("productId"));
			String productName = request.getParameter("productName");
			int count = Integer.parseInt(request.getParameter("count"));
			Double price = Double.parseDouble(request.getParameter("price"));
			String detail=request.getParameter("detail");
 			int updateId=productService.UpdateProduct(productId,productName, count, price, detail);
      		System.out.println(updateId+"aaaaaqqaaaaaa");
      		model.addAttribute("updateId",updateId);
      		return updateId;
		}
		
		
		@RequestMapping("ProductController/delProduct")
		@ResponseBody
		int delProduct(Model model,HttpServletRequest request){
 			
			int productId = Integer.parseInt(request.getParameter("productId"));
			System.out.println(productId+"productIdhahahhahdel");
			int delId=productService.DelProduct(productId);
  			model.addAttribute("delId",delId);
  			return delId;
		}
		
		@RequestMapping("ProductController/upOrDownShopProduct")
		@ResponseBody
		int upOrDownShopProduct(HttpServletRequest request){
			
			int productId = Integer.parseInt(request.getParameter("productId"));
			int type = Integer.parseInt(request.getParameter("type"));
   			int upShopId=productService.upOrDownShopProduct(productId,type);
   			return upShopId;
		}
	 
  }