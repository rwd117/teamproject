package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.WishlistBean;
import kr.co.korea.dao.WishlistDAO;

@Service
public class WishlistService {

	@Autowired
	WishlistDAO wishlistdao;
	
	public int wishcheck(WishlistBean wishlistbean) {
		return wishlistdao.wishcheck(wishlistbean);
	}
	
	public void wishadd(WishlistBean wishlistbean) {
		wishlistdao.wishadd(wishlistbean);
	}
	
	public void wishcancle(WishlistBean wishlistbean) {
		wishlistdao.wishcancle(wishlistbean);
	}
}
