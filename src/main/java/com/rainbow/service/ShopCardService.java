package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.rainbow.beans.ShopCard;
import com.rainbow.dao.ShopCardDao;


@Service("shopCardService")
public class ShopCardService{//定义一个名为shopCardService的bean

	@Resource
	private ShopCardDao shopCardDao;//注入名为shopCardDao的bean

    public void setShopCardDao(ShopCardDao shopCardDao) {
        this.shopCardDao = shopCardDao;
    }
	  
	  /**
	     * @author miaomiao
	     * @return
	     */
     
     public List<ShopCard> ShopCardList(String userId){
	    	
	    	return shopCardDao.ShopCardList(userId);
	    }
     public int addShopCard(int productId,String userId,int count){
	    	
    	 return shopCardDao.addShopCard(productId,userId,count);
	    }
     
     public int saveShopCard(int productId,String userId,int count){
	    	
    	 return shopCardDao.saveShopCard(productId,userId,count);
	    }
     public int updateShopCard(int shopCardId,int count){
	    	
    	 return shopCardDao.updateShopCard(shopCardId,count);
	    }
     public int productCount(int productId){
	    	
    	 return shopCardDao.productCount(productId);
	    }  
     public int isShopCard(String userId,int productId){
    	 return shopCardDao.isShopCard(userId,productId);
     }
     public ShopCard shopcardById(int shopCardId){
    	 return shopCardDao.shopcardById(shopCardId);
     }
     public int DelShopCard(int shopCardId){
	    	
    	 return shopCardDao.DelShopCard(shopCardId);
	    }
     
	}
