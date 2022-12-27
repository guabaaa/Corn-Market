package com.corn.market.chatting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.corn.market.chatting.domain.ChattingContent;
import com.corn.market.chatting.domain.ChattingContentList;
import com.corn.market.chatting.domain.ChattingInfo;
import com.corn.market.chatting.domain.ChattingRoom;
import com.corn.market.chatting.domain.ChattingRoomInfo;
import com.corn.market.chatting.domain.CheckChattingRoom;

@Component
public class ChattingDao {
	
	@Autowired
	private DataSource dataSource;

	//채팅방 새로 등록
	public void insertChattingRoom(ChattingRoom chattingRoom) {
		String sql = "INSERT INTO chatting_room_tbl22 "
				+ "VALUES(?,?,?,?,DEFAULT,DEFAULT)";
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, chattingRoom.getRoom_id());
			pst.setString(2, chattingRoom.getPost_id());
			pst.setString(3, chattingRoom.getSeller_id());
			pst.setString(4, chattingRoom.getBuyer_id());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pst,conn);
		}
	}
	//판매글 아이디로 판매자 아이디 가져오기
	public String selectSellerId(String post_id) {
		String user_id = "";
		String sql = "SELECT user_id "
				+ "FROM post_tbl22 "
				+ "WHERE post_id = ? ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, post_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				user_id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return user_id;
	}
	
	//채팅 내용 등록
	public void insertChattingContent (ChattingContent chattingContent) {
		String sql = "INSERT INTO chatting_content_tbl22 "
				+ "VALUES(content_sq.NEXTVAL,?,?,?,DEFAULT,DEFAULT) ";
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, chattingContent.getRoom_id());
			pst.setString(2, chattingContent.getSender_id());
			pst.setString(3, chattingContent.getChat_content());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pst,conn);
		}
	}
	
	//채팅방 목록 조회
	public ArrayList<ChattingRoomInfo> selectChattingRoom(String user_id) {
		ArrayList<ChattingRoomInfo> list = new ArrayList<>();
		String sql = "SELECT r.room_id, DECODE(?,r.seller_id,r.buyer_id,r.buyer_id,r.seller_id) id, u.profile_img, u.nickname, c.chat_content, TO_CHAR(c.send_date,'YYYY\"년 \"MM\"월 \"DD\"일\"') "
				+ "FROM chatting_room_tbl22 r "
				+ "JOIN user_tbl22 u "
				+ "ON DECODE(?,r.seller_id,r.buyer_id,r.buyer_id,r.seller_id) = u.user_id "
				+ "JOIN chatting_content_tbl22 c "
				+ "ON r.room_id = c.room_id "
				+ "WHERE (r.seller_id = ? OR r.buyer_id = ?) AND c.send_date IN(SELECT MAX(send_date) FROM chatting_content_tbl22 GROUP BY room_id) "
				+ "ORDER BY r.created DESC, c.send_date DESC";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, user_id);
			pst.setString(2, user_id);
			pst.setString(3, user_id);
			pst.setString(4, user_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String room_id = rs.getString(1);
				String other_user_id = rs.getString(2);
				String other_profile_img = rs.getString(3);
				String other_nickname = rs.getString(4);
				String last_chat_content = rs.getString(5);
				String last_send_date = rs.getString(6);
				list.add(new ChattingRoomInfo(room_id,other_user_id, other_profile_img, other_nickname, last_chat_content, last_send_date));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return list;
	}
	
	//채팅내용 조회
	public ArrayList<ChattingContentList> selectChattingContent(String room_id) {
		ArrayList<ChattingContentList> list = new ArrayList<>();
		String sql = "SELECT sender_id, TO_CHAR(send_date,'YYYY\"년 \"MM\"월 \"DD\"일\"'), chat_content, TO_CHAR(send_date, 'HH24:MI') "
				+ "FROM chatting_content_tbl22 "
				+ "WHERE room_id = ? ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String sender_id = rs.getString(1);
				String date = rs.getString(2);
				String chat_content = rs.getString(3);
				String time = rs.getString(4);
				list.add(new ChattingContentList(sender_id, date, chat_content, time));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return list;
	}
	
	//채팅창 정보 조회
	public ChattingInfo selectChattingInfo(String room_id, String user_id) {
		ChattingInfo chattingInfo = null;
		String sql = "SELECT r.post_id, p.title, p.post_img, u.profile_img, u.nickname "
				+ "FROM chatting_room_tbl22 r "
				+ "JOIN post_tbl22 p "
				+ "ON r.post_id = p.post_id "
				+ "JOIN user_tbl22 u "
				+ "ON DECODE(?,r.seller_id,r.buyer_id,r.buyer_id,r.seller_id) = u.user_id "
				+ "WHERE room_id = ? ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, user_id);
			pst.setString(2, room_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				String post_id = rs.getString(1);
				String post_title = rs.getString(2);
				String post_img = rs.getString(3);
				String other_profile_img = rs.getString(4);
				String other_nickname = rs.getString(5);
				chattingInfo = new ChattingInfo(room_id, post_id, post_title, post_img, other_profile_img, other_nickname, selectChattingContent(room_id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return chattingInfo;
	}
	
	//판매글id와 구매자id(세션)로 채팅방 확인 (채팅방 생성시)
	public CheckChattingRoom checkChattingRoom(String post_id, String user_id) {
		CheckChattingRoom check = null;
		String sql = "SELECT room_id, COUNT(*) "
				+ "FROM chatting_room_tbl22 "
				+ "WHERE post_id = ? AND buyer_id = ? "
				+ "GROUP BY room_id ";
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, post_id);
			pst.setString(2, user_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				String room_id = rs.getString(1);
				int room_count = rs.getInt(2);
				check = new CheckChattingRoom(room_id, room_count);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return check; //room_count 0이면 채팅방 없음, 1이면 채팅방 있음
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
