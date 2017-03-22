package com.rainbow.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
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
			ModelAndView model = new ModelAndView("product");
			return model;
		}
	  @RequestMapping("repertory")
		public ModelAndView repertory(){
			ModelAndView model = new ModelAndView("repertory");
			return model;
		}
	  
		@RequestMapping("ProductController/productlist")
		@ResponseBody
		public List<Product> allProduct(){
 			List<Product> productList=new ArrayList<Product>();
			productList=productService.AllProduct();
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
	 
  }