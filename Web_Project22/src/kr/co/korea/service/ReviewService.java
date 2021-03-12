package kr.co.korea.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.dao.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewdao;

	public ReviewBean reviewmeminfo(int o_mIDx) {
		return reviewdao.reviewmeminfo(o_mIDx);
	}

	public void reviewinsert(MultipartHttpServletRequest multirequest,ReviewBean reviewbean) {

		List<MultipartFile> multifilelist = new ArrayList<MultipartFile>();
		List<String> filenames = new ArrayList<String>();

		int filecheck = 0;

		if ((!reviewbean.getUpload1().isEmpty()) && (reviewbean.getUpload2().isEmpty())) {//1만 사진 입력
			MultipartFile upload1 = reviewbean.getUpload1();
			multifilelist.add(upload1);
			filecheck =1;
		} else if ((reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//2만 사진 입력
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload2);
			filecheck=2;
		} else 	if ((!reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//1,2 사진 입력
			MultipartFile upload1 = reviewbean.getUpload1();
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload1);
			multifilelist.add(upload2);
			filecheck=3;
		} 
		
		if (multifilelist.size() > 0) {
			filenames = fileupload(multirequest,multifilelist);
			if (filecheck == 1) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE1(filename1);

			} else if (filecheck == 2) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE2(filename1);

			}else if(filecheck == 3) {
				String filename1 = filenames.get(0);
				String filename2 = filenames.get(1);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setR_FILE2(filename2);
			}
		}
		
		reviewbean.setFileCheck(filecheck);
		

		reviewdao.reviewinsert(reviewbean);
	}

	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload파일 찾기,상대경로로 저장을 해야 문제가 없음.
		String filename = "";
		String Originalfilename = "";

		List<String> multilist = new ArrayList<String>();

		for (MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;

			File file = new File(root_path + upload_path + filename);

			if (mfile.getSize() != 0) {// 파일 존재 체크
				if (!file.exists()) { // 경로에 파일이 존재안 할 경우
					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리 생성

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

	public List<ReviewBean> reviewList(ReviewBean reviewbean) {
		return reviewdao.reviewList(reviewbean);
	}

	public ReviewBean reviewgetinfo(int r_ID) {
		return reviewdao.reviewgetinfo(r_ID);
	}

	public void reviewupdate(MultipartHttpServletRequest multirequest, ReviewBean reviewbean) {

		List<MultipartFile> multifilelist = new ArrayList<MultipartFile>();
		List<String> filenames = new ArrayList<String>();
		
		int filecheck = 0;
		
		if ((!reviewbean.getUpload1().isEmpty()) && (reviewbean.getUpload2().isEmpty())) {//1만 사진 입력
			MultipartFile upload1 = reviewbean.getUpload1();
			multifilelist.add(upload1);
			filecheck =1;
		} else if ((reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//2만 사진 입력
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload2);
			filecheck=2;
		} else 	if ((!reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//1,2 사진 입력
			MultipartFile upload1 = reviewbean.getUpload1();
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload1);
			multifilelist.add(upload2);
			filecheck=3;
		} 
		
		if (multifilelist.size() > 0) {
			filenames = fileupload(multirequest,multifilelist);
			if (filecheck == 1) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE1(filename1);

			} else if (filecheck == 2) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE2(filename1);

			}else if(filecheck == 3) {
				String filename1 = filenames.get(0);
				String filename2 = filenames.get(1);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setR_FILE2(filename2);
			}
		}
		
		reviewbean.setFileCheck(filecheck);
		
		reviewdao.reviewupdate(reviewbean);
	
	}

	public void reviewdelete(ReviewBean reviewbean) {
		reviewdao.reviewdelete(reviewbean);
	}

	public int reviewcount(int r_pID) {
		return reviewdao.reviewcount(r_pID);
	}
}
