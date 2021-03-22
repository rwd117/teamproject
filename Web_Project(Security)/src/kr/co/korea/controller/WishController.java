package kr.co.korea.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;



import kr.co.korea.service.UserService;


@Controller
@RequestMapping("/wishlist")
public class WishController {
	
	@Autowired
	@Lazy
	UserService userservice;
	
	@GetMapping("/wish")
	public String wish1(Model model) {
		return "/wishlist/wish";
	}

	
}
