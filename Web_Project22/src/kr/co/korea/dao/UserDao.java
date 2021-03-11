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
	
	//�젙蹂댁닔�젙
	public void modifyUserInfo(UserBean userBean) {
		sqltemp.update("user.modifyUserInfo", userBean);
	}
	//以묐났�븘�씠�뵒 泥댄겕
	public String checkUserIdExist(String mID) {
		return sqltemp.selectOne("user.checkUserIdExist",mID);
	}

}
