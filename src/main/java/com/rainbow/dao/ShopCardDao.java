package com.rainbow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.Product;
import com.rainbow.beans.ShopCard;


/**
 * @author miaomiao
 * @since 20170319
 */
public interface ShopCardDao {
	
    List<ShopCard> ShopCardList(String userId);//获取购物车
    
  //添加购物车
    public int addShopCard(@Param("productId")int productId,@Param("userId")String userId,@Param("count")int count);
    int DelShopCard(int shopCardId);
    public int saveShopCard(@Param("productId")int productId,@Param("userId")String userId,@Param("count")int count);//添加购物车
    
    public int updateShopCard(@Param("shopCardId")int shopCardId,@Param("count")int count);//修改购物车
    public int productCount(int productId);
    public int isShopCard(@Param("userId")String userId,@Param("productId")int productId);//判断购物车里产品是否存在
    //通过这个shopCardId获取productId和购物车数量
    public ShopCard shopcardById(int shopCardId);
}

