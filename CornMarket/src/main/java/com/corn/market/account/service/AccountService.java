package com.corn.market.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corn.market.account.dao.AccountDao;

@Service
public class AccountService {
	
	@Autowired
	AccountDao dao;
	
	

}
