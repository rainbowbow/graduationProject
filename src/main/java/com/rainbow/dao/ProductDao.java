package com.rainbow.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.Product;
import com.rainbow.beans.ShopCard;


/**
 * @author miaomiao
 * @since 20170304
 */
public interface ProductDao {
	
     List<Product> ShopProduct(@Param("productName")String productName,@Param("startMoney")String startMoney,@Param("endMoney")String endMoney,@Param("numStart")int numStart);//获取所有产品
    List<Product> RepertoryList(@Param("productName")String productName,@Param("type")String type);
    
    int AddProduct(Product product);
    int UpdateProduct(Product product);

    int DelProduct(List<String> productId);
    int upOrDownShopProduct(@Param("productId")int productId,@Param("type")int type);
    int updateShopCardType(@Param("productId")int productId,@Param("type")int type);
    public Product productById(int productId); 
    //通过这个productId获取productId和购物车数量，类型，价格
    public int UpdateProductCount(Map<String,Object> params);
    public int productIsOver(List<ShopCard> productId);
    int cancelRecordCount(@Param("productId")String productId,@Param("count")String count);

}

