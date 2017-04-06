package com.rainbow.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
				ModelAndView model = new ModelAndView("user/userMessage");
				return model;
			}
		 
		 @RequestMapping("oneUserMessage")
			public ModelAndView oneUserMessage(){
				ModelAndView model = new ModelAndView("user/oneUserMessage");
				return model;
			}
		 
		 
		 
		@RequestMapping("UserController/userlist")
		@ResponseBody
		public List<User> userlist(HttpServletRequest request){
			
			String userName = request.getParameter("userName");
			String sex = request.getParameter("sex");
			System.out.println(userName+"llllllllqqq"+sex);
 			List<User> userList=new ArrayList<User>();
 			userList=userService.UserListByQuery(userName,sex);
			return userList;
		} 
		
		@RequestMapping("UserController/oneUserMessage")
		@ResponseBody
		public User findByUserId(HttpSession session){
			
			User user=(User) session.getAttribute("user");
			System.out.println("userId:"+user.getUserId());
 			User oneUserMessage=new User();
 			oneUserMessage=userService.findByUserId(user.getUserId());
 			System.out.println("oneUserMessage:"+oneUserMessage.getUserId()+"\nname:"+oneUserMessage.getUserName());
			return oneUserMessage;
		} 
		@RequestMapping("UserController/updateOneUserMessage")
		@ResponseBody
		int updateUser(Model model,HttpServletRequest request){
			
			User user=new User();
			user.setUserId(request.getParameter("userId"));
			user.setUserName(request.getParameter("userName"));
			user.setSex(request.getParameter("sex"));
			user.setAddress(request.getParameter("address"));
			user.setAge(request.getParameter("age"));
			user.setPhone(request.getParameter("phone"));
			user.seteMail(request.getParameter("eMail"));
			System.out.println("name"+user.getSex());
		    int updateId= userService.updateUser(user);
      		System.out.println(request.getParameter("sex")+"updateIdaaaaaqqaaaaaa");
       		return updateId;
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
		@RequestMapping("UserController/editType")
		@ResponseBody
		int editType(HttpServletRequest request){
			
			int userId = Integer.parseInt(request.getParameter("userId"));
			String type = request.getParameter("type");
			System.out.println("typeppppppp"+type);
			
   			int editType=userService.editType(userId,type);
   			return editType;
		}
  }