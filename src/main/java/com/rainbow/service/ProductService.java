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

    public void setproductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
	  
	  /**
	     * @author miaomiao
	     * @return
	     */
     
     public List<Product> AllProduct(){
	    	
	    	return productDao.AllProduct();
	    }
		
	    
	  
	}
