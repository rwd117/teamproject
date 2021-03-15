package kr.co.korea.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.UserBean;



@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void addUserInfo(UserBean userBean) {
		sqltemp.insert("user.addUserInfo", userBean);
	}
	
	public UserBean getUserInfo(int midx){
		return sqltemp.selectOne("user.getUserInfo",midx);
	}
	
	
	public UserBean getLoginUserInfo(UserBean userBean) {
		return sqltemp.selectOne("user.getLoginInfo", userBean);
	}
	
	//정보수정
	public void modifyUserInfo(UserBean userBean) {
		sqltemp.update("user.modifyUserInfo", userBean);
	}
	//회원탈퇴
		public void memberDelete(UserBean userBean) {
			sqltemp.delete("user.memberDelete", userBean);
		}
	//중복아이디 체크
	public String checkUserIdExist(String mID) {
		return sqltemp.selectOne("user.checkUserIdExist",mID);
	}
	//아이디찾기
	public String find_id(UserBean userBean) {
		return sqltemp.selectOne("user.find_id",userBean);
	}

}
