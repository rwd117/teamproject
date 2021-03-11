package kr.co.korea.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	
	@GetMapping("/reviewwrite")//
	public String reviewwrite(int o_ID,int o_mIDx,int pID,Model model) {
		
		ReviewBean meminfo = reviewservice.reviewmeminfo(o_mIDx);
		
		model.addAttribute("meminfo",meminfo);
		model.addAttribute("o_ID",o_ID);
		model.addAttribute("o_mIDx",o_mIDx);
		model.addAttribute("pID",pID);
		
		return "/review/reviewwrite";
	}
	
	@PostMapping("/reviewriteok")
	public String reviewriteok(ReviewBean reviewbean,
								MultipartHttpServletRequest multirequest,
							   @RequestParam("file[]") List<MultipartFile> multifilelist,
							   RedirectAttributes rttr) {
		
		List<String> filenames =new ArrayList<String>();
		
		reviewbean.setFileCount(0);
		
		if(multifilelist.size()>0) {
			filenames = fileupload(multirequest,multifilelist);
			if(filenames.size()==1) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setFileCount(1);//만약 파일이 존재한다면 다시 set
			
			}else if(filenames.size()==2) {
				String filename1 = filenames.get(0);
				String filename2= filenames.get(1);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setR_FILE2(filename2);
				reviewbean.setFileCount(2);//만약 파일이 존재한다면 다시 set
				
			}
			
		}
		reviewservice.reviewinsert(reviewbean);
		
		rttr.addAttribute("pID",reviewbean.getR_pID());
		
		return "redirect:/product/productContent";
	}
	
	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload파일 찾기,상대경로로 저장을 해야 문제가 없음.
		String filename="";
		String Originalfilename="";
		
		List<String> multilist = new ArrayList<String>();
		
		for(MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;
			
			File file = new File(root_path+upload_path+filename);
			
			if(mfile.getSize()!=0) {//파일 존재 체크
				if(!file.exists()) { // 경로에 파일이 존재안할경우
					if(file.getParentFile().mkdirs()) { //경로에 해당하는 디렉토리 생성
						
						try {
							file.createNewFile();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
				}
			}
			
			try {
				mfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			multilist.add(filename);
		
		}
		
		return multilist;
	}
	
}
