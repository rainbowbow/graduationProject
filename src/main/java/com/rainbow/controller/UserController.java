package com.rainbow.controller;

import java.io.UnsupportedEncodingException;
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

import com.rainbow.beans.Address;
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
		 
		 @RequestMapping("address")
			public ModelAndView address(){
				ModelAndView model = new ModelAndView("address/address");
				return model;
			}
	 
			@RequestMapping("UserController/updateUser")
			@ResponseBody
			int updateProduct(Model model,HttpServletRequest request){
				
				User user=new User();
				
				String  userId =request.getParameter("userId");
				String userName = request.getParameter("userName");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String phone = request.getParameter("phone");
				String eMail = request.getParameter("eMail");
				String address = request.getParameter("address");

				user.setUserId(userId);
				user.setUserName(userName);
				user.setSex(sex);
				user.setAge(age);
				user.setPhone(phone);
				user.seteMail(eMail);
				user.setAddress(address);
				
				 
	 			int updateId=userService.updateUser(user);
	      		System.out.println("address:"+address+"\n"+updateId+"aaaaaqqaaaaaa");
	      	 
	      		return updateId;
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
 			
   			int editType=userService.editType(userId,type);
   			return editType;
		}
		@RequestMapping("UserController/addresslist")
		@ResponseBody
		public List<Address> addresslist(HttpSession session){
			
			User user=(User) session.getAttribute("user");
			 
 			List<Address> addressList=new ArrayList<Address>();
 			addressList=userService.AddressList(user.getUserId());
			return addressList;
		} 
		@RequestMapping("UserController/addAddress")
		@ResponseBody
		public int addAddresslist(HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException{
			
			User user=(User) session.getAttribute("user");
			String userId=user.getUserId();
			/*String province = request.getParameter("province");
			String city = request.getParameter("city");
			String district = request.getParameter("district");*/
			String address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
			String detail = request.getParameter("detail");
			String addressDetail=address+detail;
			System.out.println(addressDetail+"\n");
			
			String addressName=request.getParameter("addressName");
			String addressPhone=request.getParameter("addressPhone");
  			return  1;
		} 
		
  }