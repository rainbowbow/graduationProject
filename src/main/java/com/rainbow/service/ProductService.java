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
     public List<Product> ShopProduct(String productName,String startMoney,String endMoney,int numStart,int numEnd){
	    	
	    	return productDao.ShopProduct(productName, startMoney, endMoney, numStart, numEnd);
	    }
		
     public List<Product> RepertoryList(String productName,String type){
	    	
	    	return productDao.RepertoryList(productName,type);
	    }  
     
     public int AddProduct(Product product){
	    	
    	 return productDao.AddProduct(product);
	    }
     
     public int UpdateProduct(Product product){
	    	
    	 return productDao.UpdateProduct(product);
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
