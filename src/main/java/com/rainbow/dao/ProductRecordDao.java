package com.rainbow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.ProductRecord;
import com.rainbow.beans.ShopCard;


/**
 * @author miaomiao
 * @since 20170304
 */
public interface ProductRecordDao {
	
    List<ProductRecord> RecordList(@Param("productName")String productName,@Param("userName")String userName,@Param("userId")int userId);
    int DelProduct(int orderId);
    public int addProductRecord(ShopCard shopCard);
}

