package kr.co.korea.beans;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityMemberBeanDetails implements UserDetails{
	
	private String mid;//username
    private String mpw;//password
    private String AUTHORITY;//권한
    private int mlevel;//db에 저장된 권한 레벨
    private int mdrop;
    private boolean enable;//그러면 여기로 ㄱ
    
    private int midx;
    private String mname;
    private int mamount;
    private boolean UserLogin;
    
    
	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	public boolean isUserLogin() {
		return UserLogin;
	}

	public void setUserLogin(boolean userLogin) {
		UserLogin = userLogin;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getMamount() {
		return mamount;
	}

	public void setMamount(int mamount) {
		this.mamount = mamount;
	}

	public int getMdrop() {
		return mdrop;
	}

	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getAUTHORITY() {
		return AUTHORITY;
	}

	public void setAUTHORITY(String aUTHORITY) {
		this.AUTHORITY = aUTHORITY;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return mpw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return mid;
	}

	@Override
	public boolean isAccountNonExpired() {//계정이 만료되었는가?
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {//계정이 잠겼는가??
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {//비밀번호가 만료되었는가??
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {//이 계정 사용 가능한가?? drop로 구분.
		// TODO Auto-generated method stub
		return enable;
	}

}
