package com.corn.market.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.account.dao.AccountDao;
import com.corn.market.account.domain.AccountId;
import com.corn.market.account.domain.SearchIdPhone;

@Service
public class AccountService {
	
	@Autowired
	AccountDao dao;
	
	//아이디 찾기 - 휴대폰번호로
	public AccountId searchIdPhone(SearchIdPhone phone) {
		AccountId accountId = dao.selectUserId(phone);
		return accountId;
	}
	
	

}
