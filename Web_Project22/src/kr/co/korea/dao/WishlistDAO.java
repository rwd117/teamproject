package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.WishlistBean;

@Repository
public class WishlistDAO {

	@Autowired
	SqlSessionTemplate sqltemp;
	
	public int wishcheck(WishlistBean wishlistbean) {
		return sqltemp.selectOne("wishlist.wishcheck",wishlistbean);
	}
	
	public void wishadd(WishlistBean wishlistbean) {
		sqltemp.insert("wishlist.wishadd",wishlistbean);
	}
	
	public void wishcancle(WishlistBean wishlistbean) {
		sqltemp.delete("wishlist.wishcancle",wishlistbean);
	}
	
}
