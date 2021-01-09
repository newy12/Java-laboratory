package com.ilgusi.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ilgusi.chat.model.service.ChatService;
import com.ilgusi.favorite.model.service.FavoriteService;
import com.ilgusi.favorite.model.vo.Favorite;
import com.ilgusi.service.model.vo.Service;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;

	// (소현)찜한 목록 불러오기
	@RequestMapping("/heartList.do")
	public String heartList(Model model, int mNo, String order) {
		return "";
	}

	// (소현)채팅 시작
	@RequestMapping("/startChat.do")
	public String startChat(Model model, int sNo, String myId, String yourId) {
		// 문의하려는 서비스정보 가져오기
		ArrayList<Service> serviceList = service.selectService(sNo);
		Service oneService = serviceList.get(0);

		// 채팅방 생성
		HashMap<String, Object> room = new HashMap<String, Object>();
		room.put("sNo", sNo);
		room.put("userId", myId);
		room.put("freeId", yourId);
		service.createChat(room);

		// 만든 방 번호 가져오기
		int roomNo = service.selectOneRoom(room);

		model.addAttribute("service", oneService);
		model.addAttribute("yourId", yourId);
		model.addAttribute("roomNo", roomNo);
		return "chat/chatContent";
	}

	// (소현)채팅내용 db저장
	@ResponseBody
	@RequestMapping("/insertChat.do")
	public void insertChat(int cNo, String myId, String time, String content) {
		HashMap<String, Object> message = new HashMap<String, Object>();
		message.put("cNo", cNo);
		message.put("myId", myId);
		message.put("time", time);
		message.put("content", content);
		service.insertChat(message);

		System.out.println(cNo + "/" + myId + "/" + time + "/" + content);

	}

	@RequestMapping("/quotationFrm.do")
	public String quotationFrm() {
		return "chat/quotation";
	}

	@RequestMapping("/chatList.do")
	public String chatList() {
		return "chat/chatList";
	}

}
