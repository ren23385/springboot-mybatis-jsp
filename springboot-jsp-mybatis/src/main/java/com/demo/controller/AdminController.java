package com.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.model.Admin;
import com.demo.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("/")
	public String home(Model model) {

		Admin admin = new Admin();
		model.addAttribute("admin", admin);
		return "login";
	}
	
	@RequestMapping("/toLogin")
	public String tologin(Model model) {

		Admin admin = new Admin();
		model.addAttribute("admin", admin);
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(@ModelAttribute Admin admin, Model model, HttpSession session,@RequestParam String Vcode) {

		String serverVcode = (String) session.getAttribute(ValidateController.serverVCodeName);
		
		if(!serverVcode.equalsIgnoreCase(Vcode)) {
			model.addAttribute("msg","验证码错误");
			return "login";
		}	
		
		Admin admin2 = adminService.find(admin);
		
		if (admin2 == null) {
			Admin admin3 = new Admin();
			model.addAttribute("admin", admin3);
			model.addAttribute("msg", "用户名或密码错误");
			return "login";

		} else {
			session.setAttribute("admin", admin);
			return "redirect:home";
		}

	}

	@RequestMapping("/exit")
	public String exit(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/toLogin";
	}

}
