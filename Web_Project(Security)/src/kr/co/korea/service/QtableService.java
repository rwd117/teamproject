package kr.co.korea.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.korea.beans.QtableBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.QtableDao;

@Service
public class QtableService {
	
	@Autowired
	private QtableDao qtableDao;
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Resource(name="qtabBean")
	@Lazy
	private QtableBean qtabBean;
	
	public void addNoticeInfo(QtableBean qtableBean) {
		MultipartFile upload_file =qtableBean.getUpload_file();
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			qtableBean.setQ_file(file_name);
		}
		qtableBean.setQ_idx(loginUserBean.getMidx()); //로그인한 idx를 저장
		qtableDao.addNoticeInfo(qtableBean);//DB에 insert동작
	}
	// 멀티파트파일을 서버에 저장하고, 파일명을 문자열로 리턴 //
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name=System.currentTimeMillis()+upload_file.getOriginalFilename();  //실제파일을 가져와서 문자열로 저장
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));  //파일객체생성후 저장
			System.out.println(path_upload);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	//리스트 통째로
	public List<QtableBean> getNoticeList(){
		return qtableDao.getNoticeList();
	}

	public QtableBean getNoticeInfo(int q_idx) {
		return qtableDao.getNoticeInfo(q_idx);
	}
	
	
	public QtableBean getEditNoticeInfo(int q_idx) {
		
		return qtableDao.getEditNoticeInfo(q_idx);//DB에 insert동작
		
	}
	
	public void editNoticeInfo(QtableBean qtableBean) {
		MultipartFile upload_file =qtableBean.getUpload_file();
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			qtableBean.setQ_file(file_name);
		}
		qtableDao.editNoticeInfo(qtableBean);
		
	}
	
	
	
	
	public void deleteNoticeInfo(int q_idx) {
		qtableDao.deleteNoticeInfo(q_idx);
	}
}
