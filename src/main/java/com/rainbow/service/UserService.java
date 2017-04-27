package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rainbow.beans.Address;
import com.rainbow.beans.User;
import com.rainbow.dao.UserDao;
import com.rainbow.utils.ListHelper;

@Service("userService")
public class UserService {

	@Resource
	private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
	  
	  /**
	     * @author miaomiao
	     * @return
	     */
	    public User findByUserId(String userId) {
	    	
	        return userDao.findByUserId(userId);
	    }
        public User findByUserName(String userName) {
	    	
	        return userDao.findByUserId(userName);
	    }
	    
	    
      public User login(String userName,String password,String type) {
	    	
	        return userDao.login(userName,password,type);
	    }
     
      
      public List<Address> AddressList(String userId){
    	  return userDao.AddressList(userId);
      }
      public List<User> UserListByQuery(String userName, String sex){
	    	
	    	return userDao.UserListByQuery(userName, sex);
	    }
	    
	    public int updateUser(User user){
	    	
	    	return userDao.updateUser(user);
	    }
	    
	    public int createUser(User user) {
	         
	    	return userDao.createUser(user);
	    }
         public int editType(int userId,String type){
	    	
	    	return userDao.editType(userId,type);
	    }
         public int addAddress(Address address) {
	         
 	    	return userDao.addAddress(address);
 	    }
         public int updateAddress(Address address) {
	         
  	    	return userDao.updateAddress(address);
  	    }
         
         public int delAddress(String addressId){
        	 List<String> addressIdList = ListHelper.getList(addressId);
  	    	 return userDao.delAddress(addressIdList);
 	    }
         
          
         public int CancelDefaultAddress(List<Address> addressList){
   	    	 return userDao.CancelDefaultAddress(addressList);
 	    }
         public int defaultAddress(String addressId){
        	 return userDao.defaultAddress(addressId);
         }
         
         public Address AddressById(String addressId) {
 	    	
 	        return userDao.AddressById(addressId);
 	    }
	}
