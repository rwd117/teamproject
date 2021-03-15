package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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
	public String join_pro(@ModelAttribute("joinUserBean") UserBean userBean, BindingResult result) {
		userService.addUserInfo(userBean);// DB
		return "/user/join_success";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("afterUserBean") UserBean userBean,
			@RequestParam(value = "logcheck", defaultValue = "false") boolean logcheck, Model model) {
		model.addAttribute("logcheck", logcheck);
		System.out.println("login�� logcheck=" + logcheck);
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

	// ��������
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean userBean) {
		// db���� idx�� �ش��ϴ� id,name�� ��������
		userService.getUserInfo(userBean);

		return "/user/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyUserBean") UserBean userBean, BindingResult result) {
		userBean.setMidx(loginUserBean.getMidx());
		userService.getPwInfo(userBean);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError e : list) {
				System.out.println(e.getDefaultMessage());
				System.out.println("--");
			}
			return "/user/modify_fail";
		}

		// (update DB)
		userService.modifyUserInfo(userBean);
		return "/user/modify_success";
	}

	@GetMapping("/logout")
	public String logout() {
		loginUserBean.setUserLogin(false);
		return "/user/logout"; // �������� ����
	}

	@GetMapping("/find_id")
	public String find_id(@ModelAttribute("findidUserBean") UserBean userBean) {
		return "/user/find_id";
	}

	@PostMapping("/find_id_pro")
	public String find_id_pro(@ModelAttribute("findidUserBean") UserBean userBean, BindingResult result) {
		userService.find_id(userBean);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError e : list) {
				System.out.println(e.getDefaultMessage());
				System.out.println("--");
			}
			return "/user/modify_fail";
		}
		System.out.println(userBean.getMid());
		return "/user/modify_success";
	}

}
