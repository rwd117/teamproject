package kr.co.korea.controller;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("/pwupdate")
	public String pwupdate(@ModelAttribute("pwupdateUserBean") UserBean userBean) {
		
		return "/popup/pwupdate";
	}
	@PostMapping("/pwupdate_ok")
	public String pwupdate_ok(@ModelAttribute("pwupdateUserBean") UserBean userBean) {
		String inputpw=userBean.getMpw(); //현재 비밀번호
		String inputpw2=userBean.getMpw2(); //새 비밀번호
		String inputpw3=userBean.getMpw3();
//		System.out.println("입력한 현재 비밀번호 : "+inputpw);
//		System.out.println("입력한 새 비밀번호 : "+inputpw2);
		userService.getUserInfo(userBean);
		userBean.setMidx(loginUserBean.getMidx());
		System.out.println(userBean.getMidx());
		String loginpw=userBean.getMpw();	//로그인되어있는 비밀번호
//		System.out.println("로그인되어있는 비밀번호 : "+loginpw);
		if(!(inputpw3.equals(inputpw2))) {
			System.out.println("오잉");
			return "/popup/pwupdate_fail";
		}
		if(!(inputpw.equals(loginpw))) {
			return "/popup/pwupdate_fail";
		}
		
		userBean.setMpw(userBean.getMpw2());
		userService.modifyUserInfo(userBean);
		userService.getUserInfo(userBean);
		
		return "/popup/pwupdate_ok";
	}
	@GetMapping("/memberdelete")
	public String memberdelete(@ModelAttribute("deleteUserBean") UserBean userBean) {		
		return "/popup/memberdelete";
	}
	@PostMapping("/memberdelete_ok")
	public String memberdelete_ok(UserBean userBean) {
		String inputpw=userBean.getMpw();
		userService.getUserInfo(userBean);
		userBean.setMidx(loginUserBean.getMidx());
		String loginpw=userBean.getMpw();
		
		if(!(inputpw.equals(loginpw))) {
			return "/popup/memberdelete_fail";
		}
		else {
			
			userService.memberDelete(userBean);
			loginUserBean.setUserLogin(false);
		}	
		
		
		return "/popup/memberdelete_ok";
	}

}
