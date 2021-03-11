package kr.co.korea.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ContentBean;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void addContentInfo(ContentBean contentBean) {
		sqltemp.insert("board.addContentInfo", contentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		return sqltemp.selectOne("board.getBoardInfoName", board_info_idx);
	}
	public List<ContentBean> getContentList(int board_info_idx, RowBounds rowBounds){
		return sqltemp.selectList("board.getContentList", board_info_idx, rowBounds);
	}
	
	public ContentBean getContentInfo(int content_idx) {
		return sqltemp.selectOne("board.getContentInfo", content_idx);
	}
	
	public void modifyContentInfo(ContentBean contentBean) {
		sqltemp.update("board.modifyContentInfo", contentBean);
	}
	public void deleteContentInfo(int content_idx) {
		sqltemp.delete("board.deleteContentInfo", content_idx);
	}
	
	public int getContentCnt(int content_board_idx) {
		return sqltemp.selectOne("board.getContentCnt", content_board_idx);
	}
	
}
