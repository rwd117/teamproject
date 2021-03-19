package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.SecurityMemberBeanDetails;

@Repository
public class SecurityMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public SecurityMemberBeanDetails tempid(String mid) {
		return sqltemp.selectOne("temp.securitybyid",mid);
	}
}
