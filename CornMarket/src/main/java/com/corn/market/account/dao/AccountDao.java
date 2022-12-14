package com.corn.market.account.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AccountDao {

	@Autowired
	DataSource dataSource;
	
	private void close(AutoCloseable...acs) {
		try {
			for(AutoCloseable ac : acs) {
				if(ac != null) ac.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//

}
