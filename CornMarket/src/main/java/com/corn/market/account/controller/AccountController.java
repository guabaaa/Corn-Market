package com.corn.market.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corn.market.account.domain.AccountIdMail;
import com.corn.market.account.domain.AccountIdPhone;
import com.corn.market.account.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	AccountService service;
	
	//아이디 찾기 페이지로 이동
	@RequestMapping(value = "/account/id", method = RequestMethod.GET)
	public String searchIdGET() {
		return "account/searchid";
	}
	
	//아이디 찾기 - 휴대폰번호로
	@RequestMapping(value = "/account/id/phone", method = RequestMethod.POST)
	public String searchIdPhone(AccountIdPhone phone) {
		System.out.println(phone);
		
		return "id";
	}
	
	//아이디 찾기 - 이메일로
	@RequestMapping(value = "/account/id/mail", method = RequestMethod.POST)
	public String searchIdMail(AccountIdMail mail) {
		System.out.println(mail);
		
		return "id";
	}
	
	@RequestMapping(value = "/account/pw", method = RequestMethod.GET)
	public String searchPwGET() {
		//아이디 찾기 페이지 이동
		return "account/searchpw";
	}
	
}
