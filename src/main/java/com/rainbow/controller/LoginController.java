package com.rainbow.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
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
			public String login(Model model,HttpServletRequest request,HttpSession session){
				String userName = request.getParameter("userName");
				String password = request.getParameter("Password");
				String type = request.getParameter("RadioList");				
				
				if(userName != null && password != null){
					
					User user=userService.login(userName,password,type);
 					if(user!=null){
						System.out.println("lllllllhahah"+user.getType());
						session.setAttribute("user", user);
					    model.addAttribute("user",user);
					    if(type.equals("0")){
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
