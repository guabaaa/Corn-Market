package com.corn.market.profile.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.corn.market.profile.domain.ProfileReview;
import com.corn.market.profile.domain.ProfileSale;
import com.corn.market.profile.domain.Review;
import com.corn.market.profile.domain.Sale;

@Component
public class ProfileDao {
	
	@Autowired
	DataSource datasource;
	
	//판매내역 조회
	public ArrayList<Sale> selectOnSale(String id,String post_status) {
		ArrayList<Sale> list = new ArrayList<Sale>();
		/*
		String sql = "SELECT post_img, title, TRIM(TO_CHAR(price,'99,999,999')), town_name "
				+ "FROM post_tbl22 p "
				+ "JOIN town_tbl22 t "
				+ "ON p.town_code = t.town_code "
				+ "WHERE p.user_id = ? AND p.post_status = ? "
				+ "ORDER BY p.post_id DESC";
		*/
		String sql = "SELECT post_img, title, TRIM(TO_CHAR(price,'99,999,999')), town_name " //테스트용
				+ "FROM post_tbl22_test p "
				+ "JOIN town_tbl22 t "
				+ "ON p.town_code = t.town_code "
				+ "WHERE user_id = ? AND post_status = ? "
				+ "ORDER BY p.post_id DESC";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, post_status);
			rs = pst.executeQuery();
			while(rs.next()) {
				String post_img = rs.getString(1);
				String title = rs.getString(2);
				String price = rs.getString(3);
				String town_name = rs.getString(4);
				list.add(new Sale(post_img, title, price, town_name));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		
		return list;
	}
	
	//거래후기 조회
	public ArrayList<Review> selectReview(String id) {
		ArrayList<Review> list = new ArrayList<Review>();
		/*
		String sql = "SELECT u.nickname, e.review "
				+ "FROM end_deal_tbl22 e "
				+ "JOIN chatting_room_tbl22 c "
				+ "ON e.room_id = c.room_id "
				+ "JOIN user_tbl22 u "
				+ "ON c.seller_id = u.user_id "
				+ "WHERE u.user_id = ? "
				+ "ORDER BY e.deal_id DESC";
		 */
		String sql = "SELECT u.nickname, e.review " //테스트용
				+ "FROM end_deal_tbl22_test e "
				+ "JOIN post_tbl22_test p "
				+ "ON e.post_id = p.post_id "
				+ "JOIN user_tbl22 u "
				+ "ON p.user_id = u.user_id "
				+ "WHERE u.user_id = ? "
				+ "ORDER BY e.deal_id DESC";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String nickname = rs.getString(1);
				String review  = rs.getString(2);
				list.add(new Review(nickname, review));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}

		return list;
	}
	
	//프로필+판매내역 조회
	public ArrayList<ProfileSale> selectProfileSale(String id,String post_status) {
		ArrayList<ProfileSale> list = new ArrayList<ProfileSale>();
		String sql = "SELECT u.nickname, u.temperature, t.town_name, u.join_date, u.profile_img "
				+ "FROM user_tbl22 u "
				+ "JOIN address_tbl22 a "
				+ "ON u.user_id = a.user_id "
				+ "JOIN town_tbl22 t "
				+ "ON a.town_code = t.town_code "
				+ "WHERE u.user_id = ? ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String nickname = rs.getString(1);
				String temperature = rs.getString(2);
				String town_name = rs.getString(3);
				String join_date = rs.getString(4);
				String profile_img = rs.getString(5);
				list.add(new ProfileSale(nickname, temperature, town_name, join_date, profile_img, selectOnSale(id, post_status)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}

		return list;
	}
	
	//프로필+거래후기 조회
	public ArrayList<ProfileReview> selectProfileReview(String id) {
		ArrayList<ProfileReview> list = new ArrayList<ProfileReview>();
		String sql = "SELECT u.nickname, u.temperature, t.town_name, u.join_date, u.profile_img "
				+ "FROM user_tbl22 u "
				+ "JOIN address_tbl22 a "
				+ "ON u.user_id = a.user_id "
				+ "JOIN town_tbl22 t "
				+ "ON a.town_code = t.town_code "
				+ "WHERE u.user_id = ? ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String nickname = rs.getString(1);
				String temperature = rs.getString(2);
				String town_name = rs.getString(3);
				String join_date = rs.getString(4);
				String profile_img = rs.getString(5);
				list.add(new ProfileReview(nickname, temperature, town_name, join_date, profile_img, selectReview(id)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}

		return list;
	}

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
