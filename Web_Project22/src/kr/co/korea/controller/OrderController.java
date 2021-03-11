package kr.co.korea.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import kr.co.korea.beans.OrderBean;
import kr.co.korea.beans.OrderProductBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.CartService;
import kr.co.korea.service.OrderService;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/orders")
public class OrderController {
	
	@Autowired
	OrderService orderservice;
	
	@Autowired
	@Lazy
	UserService userservice;
	
	@Autowired
	@Lazy
	CartService cartservice;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@PostMapping("/orderwrite")
	public String order(OrderBean orderbean,
						@RequestParam(value="cha[]") List<String> Checklist,
						@RequestParam(value="allsumprice") int sumprice,
						@RequestParam(value="postcost") int postcost,
						@RequestParam(value="allsum") int allsum,
						Model model) {
		
		List<CartBean> cartlist = new ArrayList<CartBean>();
		
		int Cartid=0;
		for(String i : Checklist) {
			Cartid = Integer.parseInt(i);
			cartlist.add(cartservice.idxcartgetinfo(Cartid));
		}//카트 정보
		
		
		Map<String,Object> pricemap = new LinkedHashMap<String,Object>();
		pricemap.put("sumprice",sumprice);
		pricemap.put("postcost",postcost);
		pricemap.put("allsum",allsum);
		//결제 금액 전부 가져와서 map에 담기
		
		UserBean userbean = new UserBean();
		userservice.getUserInfo(userbean);
		
		model.addAttribute("Checklist",Checklist);
		model.addAttribute("userbean",userbean);
		model.addAttribute("cartlist",cartlist);
		model.addAttribute("pricemap",pricemap);
		
		return "/orders/order";
	}
	
	@PostMapping("/orderresult")//카트 삭제, order,order_product에 추가해야함.
	public String orderresult(OrderBean orderbean,OrderProductBean orderproductbean,
			@RequestParam(value="cha[]") List<String> Checklist,Model model) {
		
		Calendar cal = Calendar.getInstance();//해당 주문의 타이틀
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		UUID UUIDs = UUID.randomUUID();//고유 식별자
		
		String subname = UUIDs.toString().replaceAll("-", "");//String 으로 변환 후, - 기호 삭제
		subname = subname.substring(0,10);
		
		String ordertitle = ymd + "_" + subname;//날짜 + uuid로 임의로 설정
		
		orderbean.setO_title(ordertitle);
		orderbean.setO_mIDx(loginUserBean.getMidx());
		orderservice.orderinsert(orderbean);
		
		int o_id = orderbean.getO_ID();//orders테이블에 들어가는 시퀀스 따로 저장
		
		int Cartid=0;
		for(String i : Checklist) {
			Cartid = Integer.parseInt(i);
			orderproductbean.setOp_oid(o_id);//order 테이블의 기본키를 외래키로 받아옴
			orderproductbean.setO_c_id(Cartid);//카트 아이디는 여러개일경우 for문을 통하여 입력
			orderservice.orderproductinsert(orderproductbean);
			cartservice.cartdelete(Cartid);//주문에 성공하면 카트에서 해당 정보 삭제
		}
		//여기까지가 insert 이 후는 select
		
		OrderBean vieworderbean = orderservice.getmaninfo(o_id);
		List<OrderProductBean> vieworderproductlist = orderservice.getorderproudct(o_id);
		
		model.addAttribute("vieworderproductlist",vieworderproductlist);
		model.addAttribute("vieworderbean",vieworderbean);
		
		return "/orders/orderresult";
	}
	
	@GetMapping("/orderlist")
	public String orderlist(Model model) {
		int o_mIDx =loginUserBean.getMidx();
		OrderBean orderbean = new OrderBean();
		orderbean.setO_mlevel(loginUserBean.getMlevel());
		orderbean.setO_mIDx(o_mIDx);
		
		List<OrderProductBean> list = orderservice.getorderlist(orderbean);
		model.addAttribute("list",list);
		return "orders/orderlist";
	}
	
	@GetMapping("/orderread")
	public String orderread(int o_ID,Model model) {
		OrderBean vieworderbean = orderservice.getmaninfo(o_ID);
		List<OrderProductBean> vieworderproductlist = orderservice.getorderproudct(o_ID);
		
		model.addAttribute("vieworderproductlist",vieworderproductlist);
		model.addAttribute("vieworderbean",vieworderbean);
		
		return "orders/orderread";
	}
}
