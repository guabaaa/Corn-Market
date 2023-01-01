package com.corn.market.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.post.dao.PostDao;
import com.corn.market.post.domain.PostList;
import com.corn.market.post.domain.PostVO;

@Service
public class PostService {
	
	@Autowired
	PostDao dao;
	
	//판매글 전체조회
	public List<PostList> getPostList() throws Exception {
		List<PostList> list = (ArrayList<PostList>) dao.selectAll();
		getPostImgThumbnail(list);
		return list;
	}
	//판매글 카테고리별 조회
	public List<PostList> getPostCategoryList(String category_id) throws Exception {
		List<PostList> list = (ArrayList<PostList>) dao.selectCategory(category_id);
		getPostImgThumbnail(list);
		return list;
	}
	//판매글 지역별 조회
	public List<PostList> getPostTownList(String town_code) throws Exception {
		List<PostList> list = (ArrayList<PostList>) dao.selectTown(town_code);
		getPostImgThumbnail(list);
		return list;
	}
	//판매글 상세 조회
	public PostVO getOnePost(String post_id) throws Exception {
		PostVO post = dao.selectOne(post_id);
		return post;
	}
	
	//판매글 등록
	public void registerPost(PostVO post) throws Exception {
		dao.enroll(post);
	}
	
	//판매글 수정
	public void modifyPost(PostVO post) throws Exception {
		dao.update(post);
	}
	
	//판매글 삭제
	public void deletePost(String post_id) throws Exception {
		dao.delete(post_id);
	}
	
	//판매글 이미지 썸네일 가져오기
	public void getPostImgThumbnail(List<PostList> postList) {
		for (PostList post : postList) {
			String[] imgs = post.getPost_img().split(",");
			post.setPost_img(imgs[0]);
		}
	}
	
	

}
