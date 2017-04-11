package com.rainbow.beans;


import java.io.Serializable;
/**
 * @author miaomiao
 * @since 20170304
 */
public class Address implements Serializable {
	
	private String addressId;
    private String userId;
    private String address;
    private String type;
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
    
}
