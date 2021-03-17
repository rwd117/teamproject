package kr.co.korea.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.MemberDao;
import kr.co.korea.dao.UserDao;

@Service
public class MemberService {

	@Autowired MemberDao memberDao;
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public List<UserBean> memberList() throws Exception{
		return memberDao.memberList();
	}
	
		
}
