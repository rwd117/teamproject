package kr.co.korea.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.korea.beans.UserBean;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/user")

public class UserController {

	@Autowired
	@Lazy
	private UserService userService;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean userBean) {
		return "/user/join";
	}
	
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean userBean, BindingResult result) {
		userService.addUserInfo(userBean);// DB
		return "/user/join_success";
	}

	
	@GetMapping("/login")
	public String login(@ModelAttribute("afterUserBean") UserBean userBean,
			@RequestParam(value = "logcheck", defaultValue = "false") boolean logcheck, Model model) {
		model.addAttribute("logcheck", logcheck);
		System.out.println("login의 logcheck=" + logcheck);
		return "/user/login";
	}

	@GetMapping("/mypage")
	public String mypage(UserBean userBean) {
		return "/user/mypage";
	}

	

	@PostMapping("/login_pro")
	public String login_pro(UserBean userBean) {

		userService.getLoginUserInfo(userBean);
		if (loginUserBean.isUserLogin() == true) {
			System.out.println(loginUserBean.isUserLogin());
			return "/user/login_success";
		} else {
			System.out.println(loginUserBean.isUserLogin());
			return "/user/login_fail";
		}
	}

	// 정보수정
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean userBean) {
		// db에서 idx에 해당하는 id,name을 가져오기
		userService.getUserInfo(userBean);
		
		return "/user/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean userBean, BindingResult result) {

		if (result.hasErrors()) {
			return "/user/modify";
		}

		// (update DB)
		// userService.modifyUserInfo(userBean);
		return "/user/modify_success";
	}

	@GetMapping("/logout")
	public String logout() {
		loginUserBean.setUserLogin(false);
		return "/user/logout"; // 메인으로 간다
	}
}
