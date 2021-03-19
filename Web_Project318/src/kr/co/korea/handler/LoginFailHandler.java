package kr.co.korea.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler{
	
	private String mid;
	private String mpw;
	private String defaulturl;
	
	
	public String getMpw() {
		return mpw;
	}


	public void setMpw(String mpw) {
		this.mpw = mpw;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getDefaulturl() {
		return defaulturl;
	}


	public void setDefaulturl(String defaulturl) {
		this.defaulturl = defaulturl;
	}


	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		  String username = request.getParameter(mid);
	        String password = request.getParameter(mpw);
	        
	        request.setAttribute(mid, username);
	        request.setAttribute(mpw, password);
	 
	        request.getRequestDispatcher(defaulturl).forward(request, response);

		
	}

	
	
	
}
