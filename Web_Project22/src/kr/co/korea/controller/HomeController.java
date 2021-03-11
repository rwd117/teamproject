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
		System.out.println(request.getServletContext().getRealPath("/"));
		return "redirect:/main";
	}
	
	@GetMapping("main")
	public String home(Model model) {
		ArrayList<List<ContentBean>> list=new ArrayList<List<ContentBean>>();
		for(int i=1;i<=4;i++) {
			List<ContentBean> temp=mainService.getMainList(i);  //1,2,3,4게시판
			list.add(temp);
		}
		model.addAttribute("list", list);
		List<BoardInfoBean> board_list=qnaMenuService.getQnaTopList();
		model.addAttribute("board_list", board_list);
	
		
		
		return "main";
	}
}
