package com.corn.market.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.corn.market.member.domain.LoginMember;
import com.corn.market.member.domain.Member;
 

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.corn.market.MemberMapper.";

	//회원가입

	public void memberSignup(Member member) throws Exception{
		session.insert (namespace+"memberSignup" ,member);

	};

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception{

		return session.selectOne(namespace + "idCheck", id);
		//아이디가 있으면 1 없으면 0
	};

	// 닉네임 중복 검사
	public int nicknameCheck(String nickname) throws Exception{
		return session.selectOne(namespace + "nicknameCheck", nickname);
	};

	//아이디 유무 
	public Member getMemberById(LoginMember member) throws  Exception{
		return session.selectOne(namespace + "getMemberById",member);
	};

	//로그인 확인 비번+아이디 일치 확인 
	public  Member memberLogin(LoginMember member) throws Exception{

		return session.selectOne(namespace + "memberLogin", member);

	};

}