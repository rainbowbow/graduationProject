package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

 import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;
import com.rainbow.dao.ProductRecordDao;


@Service("productRecordService")
public class ProductRecordService{

	@Resource
	private ProductRecordDao productRecordDao;

    public void setProductRecordDao(ProductRecordDao productRecordDao) {
        this.productRecordDao = productRecordDao;
    }
	  
	  /**
	     * @author miaomiao
	     * @return
	     */
   
     public List<ProductRecord> RecordList(String productName,String userName,int userId){
	    	
	    	return productRecordDao.RecordList(productName,userName,userId);
	    }  
     
     public int DelProduct(int orderId){
	    	
    	 return productRecordDao.DelProduct(orderId);
	    }
     public int addProductRecord(ProductRecord productRecord){
    	 return productRecordDao.addProductRecord(productRecord);
     }
     
	}
