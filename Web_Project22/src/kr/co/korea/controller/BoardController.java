package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
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

import kr.co.korea.beans.ContentBean;
import kr.co.korea.beans.PageBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class); 
	
	@Autowired
	private BoardService boardService;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main(int board_info_idx, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("page", page);
		//DB에서 게시판의이름을 가져옴
		String boardInfoName=boardService.getBoardInfoName(board_info_idx);//게시판의 명칭을 가져오기 DB
		model.addAttribute("boardInfoName",boardInfoName);
		//DB에서 해당게시판의 내용가져오기
		List<ContentBean> contentList=boardService.getContentList(board_info_idx, page);
		model.addAttribute("contentList", contentList);
		
		PageBean pageBean=boardService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);
		return "board/main";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") ContentBean contentBean, int board_info_idx) {
		contentBean.setContent_board_idx(board_info_idx);  //게시판종류의 번호를 세팅
		return "board/write";
	}
	
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") ContentBean contentBean, BindingResult result) {
		if(result.hasErrors()) {
			return "board/write";
		}
		//for(int i=0;i<500;i++) {
			boardService.addContentInfo(contentBean); //DB에 insert됨
		//}
		return "board/write_success";
	}
	
	//상세보기에서는 content_idx, content_board_idx
	@GetMapping("/read")
	public String read(int board_info_idx, int content_idx, int page, Model model) {
	    ContentBean readContentBean=boardService.getContentInfo(content_idx);
	    model.addAttribute("readContentBean", readContentBean);
	    model.addAttribute("board_info_idx", board_info_idx);
	    model.addAttribute("content_idx", content_idx);
	    model.addAttribute("loginUserBean", loginUserBean);  //로그인한 UserBean(session영역존재하는)
	    model.addAttribute("page", page);
		return "board/read";			
	}
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyContentBean") ContentBean contentBean, int board_info_idx, int content_idx, int page, Model model) {
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);
		
		ContentBean tempContentBean=boardService.getContentInfo(content_idx);
		contentBean.setContent_write_name(tempContentBean.getContent_write_name()); //작성자(출력)
		contentBean.setContent_date(tempContentBean.getContent_date()); //날짜(출력)
		contentBean.setContent_subject(tempContentBean.getContent_subject()); //글제목(출력)
		contentBean.setContent_text(tempContentBean.getContent_text());//글내용(출력)
		contentBean.setContent_file(tempContentBean.getContent_file());//첨부파일(출력)
		contentBean.setContent_writer_idx(tempContentBean.getContent_writer_idx()); //작성자인덱서
		contentBean.setContent_board_idx(board_info_idx); //게시판인덱서
		return "/board/modify";
	}
	@GetMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") ContentBean contentBean, int page, BindingResult result, Model model) {
		
		model.addAttribute("page", page);
		
		if(result.hasErrors()) {
			return "board/modify";
		}
		boardService.modifyContentInfo(contentBean); //DB(update)
		System.out.println("수정성공");
		return "/board/modify_success";
	}
	@GetMapping("/delete")
	public String delete(int board_info_idx, int content_idx, Model model) {
		boardService.deleteContentInfo(content_idx); //DB(delete)
		model.addAttribute("board_info_idx", board_info_idx);
		return "board/delete";
	}		
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "/board/not_writer";
	}
}
