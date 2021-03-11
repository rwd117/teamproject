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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.ProductService;
import kr.co.korea.service.ReviewService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	@Lazy
	private ReviewService reviewservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@GetMapping("/productContent")
	public String productContent(int pID,Model model) {
		
		ProductBean productbean = productService.getproductInfo(pID);
		
		List<ReviewBean> reviewlist = reviewservice.reviewList(pID);
		
		model.addAttribute("pID",pID);
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("productbean",productbean);
		
		return "/product/productContent";
	}
	
	@GetMapping("/productInsert")
	public String productInsert(@ModelAttribute("productbean")ProductBean productbean) {
		
		return "/product/productInsert";
	}
	
	@PostMapping("/productInsertGo")
	public String productInsertGo(@ModelAttribute("productbean")ProductBean productbean,
									MultipartHttpServletRequest multirequest,
									 @RequestParam("image[]") List<MultipartFile> multifilelist,
									 RedirectAttributes rttr) {
		
		
		productService.insertproduct(multirequest,multifilelist,productbean);
		
		rttr.addAttribute("pID", productbean.getpID());
		
		return "redirect:/product/productContent";
	}
	
	
	
	@GetMapping("/productList")
	public String productList(int top_idx,
							  @RequestParam(value="sub_idx", defaultValue= "0")int sub_idx,
							  Model model) {
		
		List<ProductBean> productlist = productService.getproductInfo(top_idx,sub_idx);
		
		model.addAttribute("productlist",productlist);
		
		return "/product/productList";
	}

	@GetMapping("/mainproduct")
	public String mainproduct(int top_idx,
							  @RequestParam(value="sub_idx", defaultValue= "0")int sub_idx,
							  Model model) {
		
		List<ProductBean> productlist = productService.getproductInfo(top_idx,sub_idx);
		
		model.addAttribute("productlist",productlist);
		
		return "/product/mainproduct";
	}
	
	
	@GetMapping("/productModify")
	public String productModify(int pID,Model model) {
		ProductBean productbean = productService.getproductInfo(pID);
		model.addAttribute("pID",pID);
		model.addAttribute("productbean",productbean);
		return "/product/productModify";
	}
	
	@PostMapping("/productModifyok")
	public String productModifyok(@ModelAttribute("productbean")ProductBean productbean,
								  @RequestParam(value="pID") int pId,
									RedirectAttributes rttr) {
		productbean.setpID(pId);
		productService.productupdate(productbean);
		rttr.addAttribute("pID", productbean.getpID());
		return "redirect:/product/productContent";
	}
	
	@GetMapping("/productDelete")
	public String productDelete(int pID,Model model) {
		ProductBean productbean = productService.getproductInfo(pID);
		model.addAttribute("pID",pID);
		model.addAttribute("productbean",productbean);
		return "/product/productDelete";
	}
	
	@GetMapping("/productDeleteok")
	public String productDeleteok(@RequestParam(value="pID") int pID) {
		
		productService.productdelete(pID);
		
		return "redirect:/main";
	}
	
}
