package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.dao.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewdao;
	
	public ReviewBean reviewmeminfo(int o_mIDx) {
		return reviewdao.reviewmeminfo(o_mIDx);
	}
	
	public void reviewinsert(ReviewBean reviewbean) {
		reviewdao.reviewinsert(reviewbean);
	}
	
	public List<ReviewBean> reviewList(int r_pID){
		return reviewdao.reviewList(r_pID);
	}
	
}
