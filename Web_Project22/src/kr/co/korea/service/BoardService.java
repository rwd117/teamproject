package kr.co.korea.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.korea.beans.ContentBean;
import kr.co.korea.beans.PageBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.BoardDao;

@Service
public class BoardService {

	@Autowired 
	private BoardDao boardDao;
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.listCnt}")
	private int page_listCnt;
	
	@Value("${page.paginationCnt}")
	private int page_paginationCnt;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public void addContentInfo(ContentBean contentBean) {
		MultipartFile upload_file =contentBean.getUpload_file();	
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			contentBean.setContent_file(file_name);
		}
		contentBean.setContent_writer_idx(loginUserBean.getMidx()); //로그인한 idx를 저장
		boardDao.addContentInfo(contentBean);//DB에 insert동작
	}
	
	// 멀티파트파일을 서버에 저장하고, 파일명을 문자열로 리턴 //
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name=System.currentTimeMillis()+upload_file.getOriginalFilename();  //실제파일을 가져와서 문자열로 저장
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));  //파일객체생성후 저장
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public String getBoardInfoName(int board_info_idx) {
		return boardDao.getBoardInfoName(board_info_idx);
	}
    public List<ContentBean> getContentList(int board_info_idx, int page){  //DB(select *)
    	int start=(page-1)*page_listCnt;
    	RowBounds rowBounds=new RowBounds(start, page_listCnt);  //0부터10개
    	
		return boardDao.getContentList(board_info_idx, rowBounds);
	}
	public ContentBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}
	public void modifyContentInfo(ContentBean contentBean) {
		MultipartFile upload_file=contentBean.getUpload_file();
		System.out.println(upload_file);
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			contentBean.setContent_file(file_name);
		}
		boardDao.modifyContentInfo(contentBean);   //DB(update)
	}
	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}
	
	public PageBean getContentCnt(int content_board_idx, int currentPage) {       //전체갯수
	    int content_cnt=boardDao.getContentCnt(content_board_idx);  //전체갯수=502개
	    PageBean pageBean=new PageBean(content_cnt, currentPage, page_listCnt, page_paginationCnt);
	    return pageBean;
	}
	
}







