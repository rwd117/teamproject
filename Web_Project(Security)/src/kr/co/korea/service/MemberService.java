package kr.co.korea.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.MemberDao;

@Service
public class MemberService {

	@Autowired MemberDao memberDao;

	
	public List<UserBean> memberList() throws Exception{
		return memberDao.memberList();
	}
	
		
}
