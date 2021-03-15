package kr.co.korea.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;


import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		contentBean.setContent_writer_idx(loginUserBean.getMidx()); //濡쒓렇�씤�븳 idx瑜� ���옣
		boardDao.addContentInfo(contentBean);//DB�뿉 insert�룞�옉
	}
	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload�뙆�씪 李얘린,�긽��寃쎈줈濡� ���옣�쓣 �빐�빞 臾몄젣媛� �뾾�쓬.
		String filename="";
		String Originalfilename="";
		
		List<String> multilist = new ArrayList<String>();
		
		for(MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;
			
			File file = new File(root_path+upload_path+filename);
			
			if(mfile.getSize()!=0) {//�뙆�씪 議댁옱 泥댄겕
				if(!file.exists()) { // 寃쎈줈�뿉 �뙆�씪�씠 議댁옱�븞�븷寃쎌슦
					if(file.getParentFile().mkdirs()) { //寃쎈줈�뿉 �빐�떦�븯�뒗 �뵒�젆�넗由� �깮�꽦
						
						try {
							file.createNewFile();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
				}
			}
			
			try {
				mfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			multilist.add(filename);
		
		}
		
		return multilist;
	}
	// 硫��떚�뙆�듃�뙆�씪�쓣 �꽌踰꾩뿉 ���옣�븯怨�, �뙆�씪紐낆쓣 臾몄옄�뿴濡� 由ы꽩 //
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name=System.currentTimeMillis()+upload_file.getOriginalFilename();  //�떎�젣�뙆�씪�쓣 媛��졇���꽌 臾몄옄�뿴濡� ���옣
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));  //�뙆�씪媛앹껜�깮�꽦�썑 ���옣
			
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
    	RowBounds rowBounds=new RowBounds(start, page_listCnt);  //0遺��꽣10媛�
    	
		return boardDao.getContentList(board_info_idx, rowBounds);
	}
	public ContentBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}
	public void modifyContentInfo(ContentBean contentBean) {
		
		
		boardDao.modifyContentInfo(contentBean);   //DB(update)
	}
	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}
	
	public PageBean getContentCnt(int content_board_idx, int currentPage) {       //�쟾泥닿갗�닔
	    int content_cnt=boardDao.getContentCnt(content_board_idx);  //�쟾泥닿갗�닔=502媛�
	    PageBean pageBean=new PageBean(content_cnt, currentPage, page_listCnt, page_paginationCnt);
	    return pageBean;
	}
	public void qna_reply_insert(ContentBean contentBean) {
		  boardDao.qna_reply_insert(contentBean);
	}
	public void qna_reply_up(ContentBean contentBean) {
		boardDao.qna_reply_up(contentBean);
		}
	public ContentBean qnareplymax(ContentBean contentBean) {
		return boardDao.qnareplymax(contentBean);
	}
	public void qna_reply_delete(int content_bno) {
		boardDao.qna_reply_delete(content_bno);
	}



}







