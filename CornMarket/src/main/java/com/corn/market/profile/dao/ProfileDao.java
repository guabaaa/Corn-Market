package com.corn.market.profile.dao;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProfileDao {
	
	@Autowired
	DataSource datasource;
	
	
	private void close(AutoCloseable...acs) {
		for(AutoCloseable ac : acs) {
			try {
				if(ac!=null) ac.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
