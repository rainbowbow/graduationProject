package com.rainbow.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.rainbow.beans.User;
import com.rainbow.service.UserService;

@Controller
public class LoginController {
	@Resource
	UserService userService;
	
	
	        @RequestMapping("loginIn")
			public String login(Model model,HttpServletRequest request){
				String userName = request.getParameter("userName");
				String password = request.getParameter("Password");
				String identify = request.getParameter("RadioList");
				
				System.out.println("userId:"+userName+"\n password："+password+"\n identify："+identify);
				
				
				if(userName != null && password != null){
					
					User user=userService.login(userName,password);
					System.out.println(user.getUserName()+"oooo"+user.getPassword());
					if(password.equals(user.getPassword())){
						System.out.println("success");
					    model.addAttribute("user",user);
					    if(identify.equals("admin")){
					    	return "admin";
					    }else{
					    	return "user";
					    }
					
					}else{
						System.out.println("nosuccess");
						model.addAttribute("message", "erro");
		
						return "login";
					}
	 	        }else {
	 	        	model.addAttribute("message", "no");
	 	        	return "login";
	 	        }
		  }
	  
	
}
