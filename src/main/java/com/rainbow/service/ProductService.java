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
     
     public List<Product> ShopProduct(){
	    	
	    	return productDao.ShopProduct();
	    }
		
     public List<Product> RepertoryList(){
	    	
	    	return productDao.RepertoryList();
	    }  
     
     public int AddProduct(String productName,int count, double price,String detail){
	    	
    	 return productDao.AddProduct(productName,count,price,detail);
	    }
     
     public int UpdateProduct(int productId,String productName,int count, double price,String detail){
	    	
    	 return productDao.UpdateProduct(productId,productName,count,price,detail);
	    }
     
     
     
     public int DelProduct(int productId){
	    	
    	 return productDao.DelProduct(productId);
	    }
     
     public int upOrDownShopProduct(int productId,int type){
	    	
    	 return productDao.upOrDownShopProduct(productId,type);
	    }
	}
