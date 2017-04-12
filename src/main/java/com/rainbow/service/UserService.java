package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rainbow.dao.UserDao;
import com.rainbow.beans.Address;
import com.rainbow.beans.User;

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
	    
	    
      public User login(String userName,String password,String type) {
	    	
	        return userDao.login(userName,password,type);
	    }
      
      public List<User> UserList(){
	    	
	    	return userDao.UserList();
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
	}
