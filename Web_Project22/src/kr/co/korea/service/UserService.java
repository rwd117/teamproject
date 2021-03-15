package kr.co.korea.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.UserDao;

@Service
public class UserService {

	@Autowired UserDao userDao;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public void addUserInfo(UserBean userBean) {
		userDao.addUserInfo(userBean);
	}
	
	public void getUserInfo(UserBean userBean){
		UserBean serviceBean = userDao.getUserInfo(loginUserBean.getMidx());
		userBean.setMname(serviceBean.getMname());
		userBean.setMid(serviceBean.getMid());
		userBean.setMpw(serviceBean.getMpw()); //�߰�
		userBean.setMemail(serviceBean.getMemail());
		userBean.setMaddress(serviceBean.getMaddress());
		userBean.setMaddress2(serviceBean.getMaddress2());
		userBean.setMbirth(serviceBean.getMbirth());
		userBean.setMphone(serviceBean.getMphone());
		userBean.setMpost(serviceBean.getMpost());
		
	}
	
	public UserBean idxgetUserIno(int midx){
		return userDao.getUserInfo(midx);
	}//�ֹ����� ���� ���� ����
	
	
	public void getLoginUserInfo(UserBean userBean) {
		UserBean serviceBean=userDao.getLoginUserInfo(userBean); //
		if(serviceBean != null) {
			loginUserBean.setMidx(serviceBean.getMidx());
			loginUserBean.setMid(serviceBean.getMid());
			loginUserBean.setMname(serviceBean.getMname());
			loginUserBean.setMamount(serviceBean.getMamount());
			loginUserBean.setUserLogin(true);
			loginUserBean.setMlevel(serviceBean.getMlevel());
		}
	}
	//��������
		public void modifyUserInfo(UserBean userBean) {
			userDao.modifyUserInfo(userBean);
		}
		
	//ȸ��Ż��
		public void memberDelete(UserBean userBean) {
			userDao.memberDelete(userBean);
		}
	//��й�ȣ����
		public void getPwInfo(UserBean userBean){
			UserBean serviceBean = userDao.getUserInfo(loginUserBean.getMidx());
			userBean.setMpw(serviceBean.getMpw());
			
		}
	//���̵�ã��
		public void find_id(UserBean userBean){
			userDao.find_id(userBean);
		}
}
