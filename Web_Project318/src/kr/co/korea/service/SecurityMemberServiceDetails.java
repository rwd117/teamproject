package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.SecurityMemberBeanDetails;
import kr.co.korea.dao.SecurityMemberDao;

public class SecurityMemberServiceDetails implements UserDetailsService{
	
	@Autowired
	private SecurityMemberDao userdao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
			SecurityMemberBeanDetails user = userdao.tempid(username);
			String role="";
			boolean enabled =false;
			
		if(user != null) {
			if(user.getMelvel() > 0) {
				role="ROLE_ADMIN";
			}else {
				role="ROLE_MEMBER";
			}
			
			if(user.getMdrop() == 1) {
				enabled = true;
			}else {
				enabled = false;
			}
			user.setEnable(enabled);
			user.setAUTHORITY(role);
		}
		
		return user;
	}
	
}
