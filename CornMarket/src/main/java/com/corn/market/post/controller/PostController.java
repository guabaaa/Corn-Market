package com.corn.market.post.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.corn.market.common.api.fileUpload.FileUploadService;
import com.corn.market.post.dao.PostDao;
import com.corn.market.post.domain.PostList;
import com.corn.market.post.domain.PostVO;
import com.corn.market.post.service.PostService;

@Controller
public class PostController {

	@Autowired
	PostService postService;

	@Autowired
	private FileUploadService fileService;

	// 판매글 전체 조회 페이지 (기본 최신순)
	@GetMapping("/post")
	public String postRecentList(Model model) throws Exception {
		ArrayList<PostList> list = (ArrayList<PostList>) postService.getPostList();
		model.addAttribute("list",list);
		return "post/postlookup";
	} 
	// 판매글 카테고리별 조회
	@ResponseBody
	@GetMapping("/post/category/{category_id}")
	public ArrayList<PostList> postCategoryList(@PathVariable("category_id") String category_id) throws Exception {
		ArrayList<PostList> list = (ArrayList<PostList>) postService.getPostCategoryList(category_id);
		return list;
	} 
	// 판매글 지역별 조회
	@ResponseBody
	@GetMapping("/post/town/{town_code}")
	public ArrayList<PostList> postTownList(@PathVariable("town_code") String town_code) throws Exception {
		ArrayList<PostList> list = (ArrayList<PostList>) postService.getPostTownList(town_code);
		return list;
	} 
	/*
	// 판매글 상세 조회 (기본)
	@GetMapping("/post/{post_id}")
	public String getView(@PathVariable("post_id") String post_id, Model model, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		PostVO post = dao.selectOne (post_id);
		model.addAttribute("post", post);
		model.addAttribute(id);
		return "post/postotherinfo";
	}
	
	
	//게시물 작성 폼
	@GetMapping("/post/enroll")
	public String mainPageGet() {
		System.out.println("메인 페이지 ");
		return "post/postregister";
	} 

	//게시물 등록
	@PostMapping("/post/enroll")
	public String write(PostVO boardVO, HttpSession session)
			throws Exception {

		System.out.println("수정 전 boardVO : " + boardVO);

		//글쓴이 추가 
		String id = (String) session.getAttribute("id");
		boardVO.setUser_id(id);

		dao.enroll(boardVO);

		System.out.println("수정 후  boardVO : " + boardVO);

		return "post/postlookup";		// 수정필요
	}


	// 게시물 수정 위와동일한 방법임 jsp 가서 value값 지정해주면 값나옴 value="${view.title}"
	@GetMapping("/modify")
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		//PostVO vo = dao.view(bno);

		//model.addAttribute("view", vo);
	}

	// 게시물 수정
	@PostMapping("/modify")
	public String postModify(PostVO vo) throws Exception {
		dao.modify(vo);

		//수정한 bno  조회페이지로 넘어오게함 
		return "redirect:/post/postinfo?post_id=" + vo.getPost_id();
	}

	/* 수정 페이지 이동 
	@GetMapping("/modify")
	public void boardModifyGET(int post_id, Model model ) {

		model.addAttribute("pageInfo", dao.getPage(post_id));
	}

	/* 페이지 수정
	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
		dao.modify(board);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/list";
	} 

	@PostMapping("/delete")
	public String boardDeletePOST(int post_id, RedirectAttributes rttr) throws Exception {

		dao.delete(post_id);

		rttr.addFlashAttribute("result", "delete success"); // 알람 뜨게해줄거임 (삭제)

		return "redirect:/board/list";
	}

	//사진 DB에 업데이트
	@PostMapping("/post/images")
	public void updatePostImg(HttpSession session, MultipartHttpServletRequest files, HttpServletRequest request) {

		String url = service.multiFileUpload(files, request);
		System.out.println("파일 이름:"+url);
		PostVO board = new PostVO();
		//board.setPost_id(0);
		board.setPost_img(url);
		dao.updateImg(board);

	}

	*/
}
