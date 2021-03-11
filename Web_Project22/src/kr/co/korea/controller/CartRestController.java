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

import kr.co.korea.beans.CartBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.CartService;

@RestController
@RequestMapping("/cart")
public class CartRestController {

	@Autowired
	private CartService cartservice;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	

	@PostMapping("/cart/{c_m_IDx}/{c_p_ID}/{cAmount}") // content에서 실행되는 ajax
	public Map<String, Object> cart(@PathVariable int c_m_IDx, @PathVariable int c_p_ID,
			@PathVariable int cAmount) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			CartBean cartbean = new CartBean();
			cartbean.setC_m_IDx(c_m_IDx);
			cartbean.setC_p_ID(c_p_ID);
			cartbean.setcAmount(cAmount);

			int check = cartservice.cartCheck(cartbean);

			if (check == 0) {

				cartservice.cartinsert(cartbean);
				map.put("result", "insertsuccess");

			} else if (check == 1) {

				cartservice.cartamountadd(cartbean);
				map.put("result", "updatesuccess");

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	
	@PostMapping("/cartlist/{midx}")//로드 됬을 시 list를 불러냄.
	public List<CartBean> cartlist(@PathVariable int midx) {
		List<CartBean> cartlist = cartservice.cartgetinfo(midx);
		
		return cartlist;
		
	}

	@PostMapping("/cartchange/{cID}/{c_m_IDx}/{cAmount}")//cart에서 수량 변화했을시.
	public Map<String, Object> amountchange(@PathVariable int cID, 
											@PathVariable int c_m_IDx,
											@PathVariable int cAmount) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			CartBean cartbean = new CartBean();
			cartbean.setcID(cID);
			cartbean.setC_m_IDx(c_m_IDx);
			cartbean.setcAmount(cAmount);
			
			cartservice.cartamountchange(cartbean);
			
			map.put("result", "change");


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}

	@PostMapping("/cartdelete/{cID}")//굳이 hashmap으로 해야할까? 
	public Map<String, Object> amountchange(@PathVariable int cID) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		cartservice.cartdelete(cID);
		
		map.put("result", "delete");
		
		return map;
	}
	
}
