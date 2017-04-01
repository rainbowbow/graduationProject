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
import com.rainbow.beans.ProductRecord;
import com.rainbow.service.ProductRecordService;
  
@Controller
public class ProductRecordController {

	  //Logger log=LoggerFactory.getLogger(getClass());
	  
	  @Resource
	  ProductRecordService productRecordService;
	 
	  @RequestMapping("product_record")
		public ModelAndView product(){
			ModelAndView model = new ModelAndView("productRecord/product_record");
			return model;
		}
	  
	  
		@RequestMapping("ProductRecordController/productRecordList")
		@ResponseBody
		public List<ProductRecord> ShopProductRecord(HttpServletRequest request){
			String productName = request.getParameter("productName");
			String userName = request.getParameter("userName");
			System.out.println(productName+"bbbbaabbb"+userName); 			
 			List<ProductRecord> recordList=new ArrayList<ProductRecord>();
 			recordList=productRecordService.RecordList(productName,userName);
			return recordList;
		}
		@RequestMapping("ProductRecordController/delProductRecord")
		@ResponseBody
		int delProduct(Model model,HttpServletRequest request){	
			
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
		
	 
  }