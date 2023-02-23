package com.edu.springshop.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

//쇼핑몰의 메인을 처리하는 하위 컨트롤러 

@Controller
public class MainController {
	
	@GetMapping("/")
	public ModelAndView getMain() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/index");
		
		return mav;
	}
	
}







