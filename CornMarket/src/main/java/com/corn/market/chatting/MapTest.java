package com.corn.market.chatting;

import java.util.concurrent.ConcurrentHashMap;



public class MapTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ConcurrentHashMap<WebSocketInfo, String> list = new ConcurrentHashMap<WebSocketInfo, String>();
		WebSocketInfo info = new WebSocketInfo("room1", "id1");
		list.put(info, "test2");
		list.put(new WebSocketInfo("room1", "id1"), "test1");
		System.out.println(list.containsKey(info));
		System.out.println(list.get(info));
	}

}
