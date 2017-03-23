package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rainbow.beans.Product;
import com.rainbow.dao.ProductDao;


@Service("productService")
public class ProductService{

	@Resource
	private ProductDao productDao;

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
	  
	  /**
	     * @author miaomiao
	     * @return
	     */
     
     public List<Product> AllProduct(){
	    	
	    	return productDao.AllProduct();
	    }
		
     public List<Product> RepertoryList(){
	    	
	    	return productDao.RepertoryList();
	    }  
     
     public int AddProduct(String productName,String count, String price,String detail){
	    	
    	 return productDao.AddProduct(productName,count,price,detail);
	    }
     
     public int DelProduct(int productId){
	    	
    	 return productDao.DelProduct(productId);
	    }
	}
