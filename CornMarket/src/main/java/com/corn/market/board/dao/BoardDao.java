package com.corn.market.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corn.market.board.domain.BoardVO;
import com.corn.market.member.domain.Member;

@Repository
public class BoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.corn.market.BoardMapper.";
    
    

  
	/* 게시물  등록 */
    public void enroll(BoardVO board) throws Exception {
    	
       session.insert(namespace+"enroll",board);
    };

    
    /* 게시판 리스트  */
    public List<BoardVO> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } 
    
    
    /*게시물  상세보기 이미지파일  제목  가격 내용 카테고리  */
    
 
    public BoardVO view(int post_id) throws Exception {

    return session.selectOne(namespace + "view", post_id);
    	}
	
    
    
    
	/* 게시판 수정 */
  
    public void modify(BoardVO board) throws Exception{
 
    session.update(namespace+"modify", board);
    
    };
    
    
    /* 게시판 삭제 */
    public  void delete(int post_id) throws Exception{
    	
    session.delete(namespace+"delete", post_id); 
    	
    };
    
    
}
    
    
   // 게시판 목록(페이징 적용) 
   // public List<BoardVO> getListPaging(Criteria cri)throws Exception{
    	
   // };

  
