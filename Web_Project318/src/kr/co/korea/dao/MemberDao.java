package kr.co.korea.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.UserBean;



@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	
	//멤버리스트 조회
	public List<UserBean> memberList() throws Exception{
		return sqltemp.selectList("user.selectMemberList");
	}
	
}
