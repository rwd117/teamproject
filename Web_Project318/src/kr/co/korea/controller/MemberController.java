package kr.co.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.service.MemberService;

@Controller
@RequestMapping("/members")
public class MemberController {

	@Autowired
	@Lazy
	private MemberService memberService;
	
	@GetMapping("member")
	public String member() {
		return "/members/member";
	}
	@GetMapping("memberlist")
	public String memberlist(Model model) throws Exception {
		
		model.addAttribute("list", memberService.memberList());
		
		return "/members/memberlist";
	}
}
