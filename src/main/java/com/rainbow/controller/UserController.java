package com.rainbow.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rainbow.beans.Product;
import com.rainbow.beans.User;
import com.rainbow.service.UserService;

@Controller
public class UserController {

	  //Logger log=LoggerFactory.getLogger(getClass());
	  
	  @Resource
	  UserService userService;
	 
	 
		@RequestMapping("admin")
		public ModelAndView admin(){
			ModelAndView model = new ModelAndView("admin");
			return model;
		}
		@RequestMapping("user")
		public ModelAndView user(){
			ModelAndView model = new ModelAndView("user");
			return model;
		}
		@RequestMapping("login")
		public ModelAndView login(){
			ModelAndView model = new ModelAndView("login");
			return model;
		}
		 @RequestMapping("userMessage")
			public ModelAndView product(){
				ModelAndView model = new ModelAndView("userMessage");
				return model;
			}
		 
		 @RequestMapping("oneUserMessage")
			public ModelAndView oneUserMessage(){
				ModelAndView model = new ModelAndView("oneUserMessage");
				return model;
			}
		 
		 
		 
		@RequestMapping("UserController/userlist")
		@ResponseBody
		public List<User> userlist(){
 			List<User> userList=new ArrayList<User>();
 			userList=userService.UserList();
			System.out.println(userList.get(0).getUserName());
			return userList;
		} 
		
		@RequestMapping("UserController/oneUserMessage")
		@ResponseBody
		public User findByUserId(HttpSession session){
			
			String userId=(String) session.getAttribute("userId");
 			User oneUserMessage=new User();
 			oneUserMessage=userService.findByUserId(userId);
			System.out.println(oneUserMessage.getUserName()+"hahahha");
			return oneUserMessage;
		} 
		 
		 /*@RequestMapping("UserController/userlist")
			@ResponseBody
			public List<User> userlistByQuery(HttpServletRequest request){
				String userName = request.getParameter("userName");
				String age = request.getParameter("age");

			   List<User> userListByQuery=new ArrayList<User>();
	 			userListByQuery=userService.UserListByQuery(userName,age);
				System.out.println(userListByQuery.get(0).getUserName());
				return userListByQuery;
			}*/
	 
  }