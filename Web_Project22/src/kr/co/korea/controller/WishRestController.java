package kr.co.korea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.WishBean;
import kr.co.korea.service.WishService;

@RestController
@RequestMapping("/wishlist")
public class WishRestController {
	
	@Autowired
	WishService wishService;
	
	@Resource(name= "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	
	@PostMapping("/wish/{w_mIDx}/{w_pID}/{wAmount}")
	public Map<String, Object> wish(@PathVariable int w_pID,@PathVariable int w_mIDx, @PathVariable int wAmount){
		Map<String, Object> map = new HashMap<String, Object>();
		
	try {
		WishBean wishBean = new WishBean();
		wishBean.setW_mIDx(w_mIDx);
		wishBean.setW_pID(w_pID);
		wishBean.setwAmount(wAmount);
		
		int check= wishService.wishcheck(wishBean);
		System.out.println(check);
		if(check ==0) {
			wishService.wishadd(wishBean);
			map.put("result", "wishadd");
			
		}else if(check > 1) {
			wishService.wishcancle(wishBean);
			map.put("result", "wishcancle");
			}
			
	}
	 catch (Exception e) {
		e.printStackTrace();
		map.put("result", "fail");
	 		
		}
		return map;
	}
	@PostMapping("/wishlist/{midx}")//로드 됬을 시 list를 불러냄.
	public List<WishBean> wishlist (@PathVariable int midx) {
		List<WishBean> wishlist = wishService.wishgetinfo(midx);
		
		return wishlist;
		
	}
	
	@PostMapping("/wishcancle/wID}")//굳이 hashmap으로 해야할까? 
	public Map<String, Object> wishcancle(@PathVariable int wID) {
		Map<String, Object> map = new HashMap<String, Object>();
		WishBean wishBean = new WishBean();
		wishBean.setwID(wID);
		wishService.wishcancle(wishBean);
		
		
		map.put("result", "delete");
		
		return map;
	}
	
}
