package com.corn.market.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corn.market.post.domain.PostList;
import com.corn.market.post.domain.PostVO;

@Repository
public class PostDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.corn.market.PostMapper.";

	// 판매글 전체 조회 - 최신글 (기본)
	public List<PostList> selectAll() throws Exception {
		return session.selectList(namespace+"selectAll");
	} 
	// 판매글 카테고리별 조회
	public List<PostList> selectCategory(String category_id) throws Exception {
		return session.selectList(namespace+"selectCategory", category_id);
	} 
	// 판매글 지역별 조회
	public List<PostList> selectTown(String town_code) throws Exception {
		return session.selectList(namespace+"selectTown", town_code);
	} 
	
	// 판매글 상세 조회
	public PostVO selectOne(String post_id) throws Exception {
		return session.selectOne(namespace + "selectOne", post_id);
	}
	
	// 판매글 등록
	public void enroll(PostVO post) throws Exception {
		session.insert(namespace+"enroll", post);
	}

	/* 게시판 수정 */
	public void modify(PostVO board) throws Exception{
		session.update(namespace+"modify", board);
	}

	/* 게시판 삭제 */
	public  void delete(int post_id) throws Exception{
		session.delete(namespace+"delete", post_id); 
	}

	//사진 업로드
	public void updateImg(PostVO board) {
		session.update(namespace+"updateImg",board);
	}

}
    
    
   // 게시판 목록(페이징 적용) 
   // public List<BoardVO> getListPaging(Criteria cri)throws Exception{
    	
   // };

  
