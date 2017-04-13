package com.rainbow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rainbow.beans.Address;
import  com.rainbow.beans.User;

/**
 * @author miaomiao
 * @since 20170304
 */
public interface UserDao {
	
	User login(@Param("userName")String userName,@Param("password")String password,@Param("type")String type);
	
	User findByUserId(String userId);//获取某个用户
	
	List<Address> AddressList(String userId);//获取所有地址
    List<User> UserList();//获取所有用户
    List<User> UserListByQuery(@Param("userName")String userName, @Param("sex")String sex);
    public int createUser(User user);//添加用户
    
    public int updateUser(User user);//修改用户
    public int editType(@Param("userId")int userId,@Param("type")String type);//修改用户状态
    public int addAddress(Address address);//添加用户
    

}

