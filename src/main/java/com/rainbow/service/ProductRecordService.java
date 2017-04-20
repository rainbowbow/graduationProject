package com.rainbow.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

 import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;
import com.rainbow.dao.ProductRecordDao;
import com.rainbow.utils.ListHelper;


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
   
     public List<ProductRecord> RecordList(String productName,String userName,int userId,String orderTime){
	    	
	    	return productRecordDao.RecordList(productName,userName,userId,orderTime);
	    }  
     
     public int DelProduct(String orderId){
    	 List<String> orderIdList = ListHelper.getList(orderId);
    	 return productRecordDao.DelProduct(orderIdList);
	    }
     public int UserDelProduct(String orderId){
    	 List<String> orderIdList = ListHelper.getList(orderId);
    	 return productRecordDao.UserDelProduct(orderIdList);
	    }
     public int addProductRecord(Map<String,Object> params){
    	 return productRecordDao.addProductRecord(params);
     }
     
	}
