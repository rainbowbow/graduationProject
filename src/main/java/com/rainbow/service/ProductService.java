package com.rainbow.service;
import java.util.ArrayList;
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
    public int updateShopCardType(int productId,int type){
    	
    	return productDao.updateShopCardType(productId, type);
    }
     public List<Product> ShopProduct(){
	    	
	    	return productDao.ShopProduct();
	    }
		
     public List<Product> RepertoryList(String productName,String type){
	    	
	    	return productDao.RepertoryList(productName,type);
	    }  
     
     public int AddProduct(String productName,int count, double price,String detail){
	    	
    	 return productDao.AddProduct(productName,count,price,detail);
	    }
     
     public int UpdateProduct(int productId,String productName,int count, double price,String detail){
	    	
    	 return productDao.UpdateProduct(productId,productName,count,price,detail);
	    }
     
    
     
     public int DelProduct(String productId){
    	 List<String> productIdList = getList(productId);
    	 return productDao.DelProduct(productIdList);
	    }
     
     public int upOrDownShopProduct(int productId,int type){
	    	
    	 return productDao.upOrDownShopProduct(productId,type);
	    }
     
   //通过这个productId获取productId和购物车数量，类型，价格
     public Product productById(int productId){
    	 return productDao.productById(productId);
     }
     
     
     public List<String> getList(String id) {
    	      List<String> list = new ArrayList<String>();
    	      String[] str = id.split(",");
    	       for (int i = 0; i < str.length; i++) {
    	          list.add(str[i]);
    	      }
    	      return list;
    	  }
     
	}
