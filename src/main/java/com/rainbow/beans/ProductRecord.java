package com.rainbow.beans;


import java.io.Serializable;
/**
 * @author miaomiao
 * @since 201703015
 */
public class ProductRecord implements Serializable {
    private String productId;
    private String productName;
    private String price;
    private String count;
    private String detail;
    private String type;//0:在售；1：库存（未上架+下架）
	 
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
   
	 
	
}
