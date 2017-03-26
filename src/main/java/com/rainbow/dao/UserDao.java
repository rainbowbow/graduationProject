package com.rainbow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import  com.rainbow.beans.User;

/**
 * @author miaomiao
 * @since 20170304
 */
public interface UserDao {
	
	User login(@Param("userName")String userName,@Param("password")String password,@Param("type")String type);
	
	User findByUserId(String userId);//获取某个用户
	
	
    List<User> UserList();//获取所有用户
    List<User> UserListByQuery(@Param("userName")String userName, @Param("sex")String sex);
    public void createUser(User user);//添加用户
    
    public void updateUser(User user);//修改用户

    
     

}

