package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.korea.beans.SecurityMemberBeanDetails;

public class SecrurityMemberAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService userdese;
	
	@Autowired
	@Lazy
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		// TODO Auto-generated method stub
		String mid= (String) auth.getPrincipal();//username 즉 mid view에서 넘어오는 값
		String mpw= (String) auth.getCredentials();//password 즉 mpw view에서 넘어오는 값
		
		SecurityMemberBeanDetails user = (SecurityMemberBeanDetails) userdese.loadUserByUsername(mid);
		
		if(!matchPassword(bcryptPasswordEncoder.encode(mpw), user.getPassword())) {
			throw new BadCredentialsException(mid);
		}
		if(!user.isEnabled()) {
            throw new BadCredentialsException(mid);
        }
		
		return new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
		//user토큰에 아이디, 비밀번호 ,권한을 넘김

	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	private boolean matchPassword(String loginPwd, String password) {
        return bcryptPasswordEncoder.matches(loginPwd, password);
    }


	
}
