package kr.co.korea.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.korea.beans.ProductBean;
import kr.co.korea.dao.ProductDao;

@Service
public class ProductService {

	@Autowired
	private ProductDao productdao;
	

	public void insertproduct(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist,ProductBean productbean) {
		
		List<String> imagenames = new ArrayList<String>();
		
		productbean.setImagecount(imagenames.size());
		if(multifilelist.size()>0) {
			imagenames = fileupload(multirequest,multifilelist);
			if(imagenames.size()==1) {
				String filename1 = imagenames.get(0);
				productbean.setpIMAGE1(filename1);
				productbean.setImagecount(imagenames.size());
				
			}else if(imagenames.size()==2) {
				String filename1 = imagenames.get(0);
				String filename2= imagenames.get(1);
				productbean.setpIMAGE1(filename1);
				productbean.setpIMAGE2(filename2);
				productbean.setImagecount(imagenames.size());
			}
		}
		
		productdao.insertproduct(productbean);

	}
	
	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload파일 찾기,상대경로로 저장을 해야 문제가 없음.
		String filename="";
		String Originalfilename="";
		
		List<String> multilist = new ArrayList<String>();
		
		for(MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;
			
			File file = new File(root_path+upload_path+filename);
			
			if(mfile.getSize()!=0) {//파일 존재 체크
				if(!file.exists()) { // 경로에 파일이 존재안할경우
					if(file.getParentFile().mkdirs()) { //경로에 해당하는 디렉토리 생성
						
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
	

	public List<ProductBean> getproductInfo(int top_idx,int sub_idx) {
		ProductBean productbean = new ProductBean();
		productbean.setP_sub_idx(sub_idx);
		productbean.setP_top_idx(top_idx);
		
		return productdao.getproductInfo(productbean);
	}

	public ProductBean getproductInfo (int pID) {
		return productdao.getproductInfo(pID);
	}
	
	public void productupdate(ProductBean productbean) {
		productdao.productupdate(productbean);
	}
	
	public void productdelete(int pID) {
		productdao.productdelete(pID);;
	}

}
