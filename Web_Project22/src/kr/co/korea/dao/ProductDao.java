package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ProductBean;

@Repository
public class ProductDao {
	
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public int insertproduct(ProductBean productbean) {
		sqltemp.insert("product.productinsert",productbean);
		return productbean.getpID();
	}
	
	public List<ProductBean> getproductInfo(ProductBean productbean) {
		return sqltemp.selectList("product.getproductInfolist",productbean);
	}
	
	public ProductBean getproductInfo (int pID) {
		return sqltemp.selectOne("product.getproductInfo",pID);
	}
	
	public void productupdate(ProductBean productbean) {
		sqltemp.update("product.productupdate",productbean);
	}
	
	public void productdelete(int pID) {
		sqltemp.delete("product.productdelete",pID);
	}
	
}
