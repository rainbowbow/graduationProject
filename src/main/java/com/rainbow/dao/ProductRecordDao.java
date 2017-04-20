package com.rainbow.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;


/**
 * @author miaomiao
 * @since 20170304
 */
public interface ProductRecordDao {
	
    List<ProductRecord> RecordList(@Param("productName")String productName,@Param("userName")String userName,@Param("userId")int userId,@Param("orderTime")String orderTime);
    int DelProduct(List<String> orderId);
    int UserDelProduct(List<String> orderId);
    public int addProductRecord(Map<String,Object> params);
    public int cancelDel(String orderId);

}

