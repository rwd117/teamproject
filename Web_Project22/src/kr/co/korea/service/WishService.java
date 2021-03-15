package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.WishBean;
import kr.co.korea.dao.WishDao;

@Service
public class WishService {

	@Autowired
	WishDao wishdao;
	
	public void wishadd(WishBean wishBean) {
		wishdao.wishadd(wishBean);
	}
	public int wishcheck(WishBean wishBean) {
		return wishdao.wishcheck(wishBean);
	}
	public void wishcancle(WishBean wishBean) {
		wishdao.wishcancle(wishBean);
	}
	public List<WishBean> wishgetinfo(int midx){
		return wishdao.wishgetinfo(midx);
	}
	public WishBean idxwishgetinfo(int midx){
		return wishdao.idxwishgetinfo(midx);
	}//�ֹ����� ���� bean
}
