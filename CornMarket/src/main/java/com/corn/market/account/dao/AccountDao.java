package com.corn.market.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.corn.market.account.domain.AccountId;
import com.corn.market.account.domain.SearchIdMail;
import com.corn.market.account.domain.SearchIdPhone;

@Component
public class AccountDao {

	@Autowired
	DataSource dataSource;
	
	//아이디 찾기 - 이름, 휴대폰번호로
	public AccountId selectUserId1(SearchIdPhone phone) {
		String user_id = "";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT user_id FROM user_tbl22 WHERE user_name = ? AND phone = ?";
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, phone.getUser_name());
			pst.setString(2, phone.getPhone());
			rs = pst.executeQuery();
			if(rs.next()) {
				user_id = rs.getString(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		AccountId id = new AccountId(user_id);
		return id;
	}
	
	//아이디 찾기 - 이메일로
	public AccountId selectUserId2(SearchIdMail mail) {
		String user_id = "";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT user_id FROM user_tbl22 WHERE user_name = ? AND email = ?";
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, mail.getUser_name());
			pst.setString(2, mail.getEmail());
			rs = pst.executeQuery();
			if(rs.next()) {
				user_id = rs.getString(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		AccountId id = new AccountId(user_id);
		return id;
	}
	
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
