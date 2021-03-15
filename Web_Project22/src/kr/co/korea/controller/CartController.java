package kr.co.korea.controller;





import java.awt.List;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.korea.beans.CartBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.WishBean;
import kr.co.korea.service.CartService;
import kr.co.korea.service.UserService;
import kr.co.korea.service.WishService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	@Lazy
	private CartService cartservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	@Lazy
	private WishService wishService;
	
	@Autowired
	@Lazy
	UserService userservice;
	
	@GetMapping("/cart")
	public String cart(Model model) {
		

		return "/cart/cart";
	}
	
	@PostMapping("/cartwrite")
	public String cartwrite(CartBean cartBean,
			@RequestParam(value="cha[]") java.util.List<String> Checklist,
			@RequestParam(value="allsumprice") int sumprice,
			@RequestParam(value="postcost") int postcost,
			@RequestParam(value="allsum") int allsum,
			Model model) {
		
			java.util.List<WishBean> wishlist =new ArrayList<WishBean>();
	
			int Wishid=0;
			for(String i : Checklist) {
			Wishid = Integer.parseInt(i);
			wishlist.add(wishService.idxwishgetinfo(Wishid));
	}
	 	UserBean userbean = new UserBean();
	 	userservice.getUserInfo(userbean);
	 	
	 	Map<String,Object> pricemap = new LinkedHashMap<String,Object>();
		pricemap.put("sumprice",sumprice);
		pricemap.put("postcost",postcost);
		pricemap.put("allsum",allsum);
		//결제 금액 전부 가져와서 map에 담기
	
		model.addAttribute("Checklist",Checklist);
		model.addAttribute("userbean",userbean);
		model.addAttribute("wishlist",wishlist);
		model.addAttribute("pricemap",pricemap);
		
		
		return "rediect:/cart/cart";
	}
		
	}
	

	
	


