package kr.co.korea.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.beans.UserBean;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/popup")
public class PopupController {

	@Autowired
	@Lazy
	private UserService userService;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@GetMapping("/popup1")
	public String popup1() {
		return "/popup/popup1";
	}
	@GetMapping("/popup2")
	public String popup2() {
		return "/popup/popup2";
	}
}
