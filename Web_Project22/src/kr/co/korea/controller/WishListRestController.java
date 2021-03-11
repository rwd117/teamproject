package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.WishlistBean;
import kr.co.korea.service.WishlistService;

@RestController
public class WishListRestController {

	@Autowired
	WishlistService wishlistservice;

	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@PostMapping("/wishlistcheck/{w_pID}/{w_mIDx}")//count 해서 1이면 위시리스트 삭제, 0이면 위시리스트 추가. 
	public Map<String, Object> wishcheck(@PathVariable int w_pID,@PathVariable int w_mIDx) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			
			WishlistBean wishlistbean =new WishlistBean();
			wishlistbean.setW_mIDx(w_mIDx);
			wishlistbean.setW_pID(w_pID);
		
			int check = wishlistservice.wishcheck(wishlistbean);
		
			if(check==0) {
				
				wishlistservice.wishadd(wishlistbean);
				map.put("result", "wishadd");
				
			}else if(check==1) {
				wishlistservice.wishcancle(wishlistbean);
				map.put("result", "wishcancle");
				
			}
		
		} catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			
		}
		
		return map;
	}

	
}
