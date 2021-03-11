package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ReviewBean;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public ReviewBean reviewmeminfo(int o_mIDx) {
		return sqltemp.selectOne("review.reviewwirtememinfo",o_mIDx);
	}
	
	public void reviewinsert(ReviewBean reviewbean) {
		sqltemp.insert("review.reviewinsert",reviewbean);
	}
	
	public List<ReviewBean> reviewList(int r_pID){
		return sqltemp.selectList("review.reviewlist",r_pID);
	}
}
