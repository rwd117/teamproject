package kr.co.korea.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.korea.beans.BoardInfoBean;
import kr.co.korea.beans.ContentBean;

import kr.co.korea.service.MainService;
import kr.co.korea.service.QnaMenuService;


@Controller
public class HomeController {
	
	@Autowired
	private MainService mainService;
	@Autowired
	public QnaMenuService qnaMenuService;
	
	
	@GetMapping("/")
	public String main(HttpServletRequest request) {
		
	return "main";

	}
	
	@GetMapping("main")
	public String home(Model model) {
		ArrayList<List<ContentBean>> list=new ArrayList<List<ContentBean>>();
		List<BoardInfoBean> board_list=qnaMenuService.getQnaTopList();
		model.addAttribute("board_list", board_list);
		
		return "main";
	}
}
