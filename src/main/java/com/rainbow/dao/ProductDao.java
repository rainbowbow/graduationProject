package com.rainbow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.Product;


/**
 * @author miaomiao
 * @since 20170304
 */
public interface ProductDao {
	
    List<Product> ShopProduct();//获取所有产品
    List<Product> RepertoryList();
    
    int AddProduct(@Param("productName")String productName,@Param("count")String count,@Param("price")String price, @Param("detail")String detail);

    int DelProduct(int productId);
    int upOrDownShopProduct(@Param("productId")int productId,@Param("type")int type);
}

