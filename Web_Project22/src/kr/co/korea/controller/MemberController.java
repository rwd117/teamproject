package kr.co.korea.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/members")
public class MemberController {

	@GetMapping("member")
	public String member() {
		return "/members/member";
	}
	@GetMapping("memberlist")
	public String memberlist() {
		return "/members/memberlist";
	}
}
