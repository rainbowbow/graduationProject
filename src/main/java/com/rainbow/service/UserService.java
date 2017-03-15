package com.rainbow.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rainbow.dao.UserDao;

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
	    public User findByUserId(String userName) {
	    	
	        return userDao.findByUserId(userName);
	    }
	    
	    
      public User login(String userName,String password) {
	    	
	        return userDao.login(userName,password);
	    }
      
	    List<User> AllUser(){
	    	
	    	return userDao.AllUser();
	    }
		
	    
	    public void updateUser(User user){
	    	
	    	userDao.updateUser(user);
	    }
	    
	    public void createUser(User user) {
	         
	        userDao.createUser(user);
	    }
	}
