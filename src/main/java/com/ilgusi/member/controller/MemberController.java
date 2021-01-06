package com.ilgusi.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ilgusi.member.model.service.MemberService;
import com.ilgusi.member.model.vo.Member;
import com.ilgusi.service.model.vo.Join;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	public MemberController() {
		super();
		System.out.println("Member컨트롤러 생성 완료");
	}
	@RequestMapping("/join.do")
	public String joinFrm() {
		System.out.println("join.do 접속");
		return "member/joinFrm";
	}
	
	@RequestMapping("/login.do")
	public String login(String id,String pw) {
		System.out.println("로그인 시도");
		
		return "/";
	}
	
	//(문정)사용자 마이페이지 이동
	@RequestMapping("/userMypage.do")
	public String userMypage() {
		return "member/userMypage";
	}
	
	//(문정)사용자 마이페이지-찜한 리스트 이동
	@RequestMapping("/userHeartList.do")
	public String userHeartList() {
		return "member/userHeartList";
	}
	
	//(문정)사용자 마이페이지-거래내역
	@RequestMapping("/userTradeHistory.do")
	public String userTradeHistory() {
		return "member/userTradeHistory";
	}
}
