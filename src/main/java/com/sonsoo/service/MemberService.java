package com.sonsoo.service;

import com.sonsoo.domain.MemberVO;

public interface MemberService {

	// 로그인하기
	public MemberVO getMember(MemberVO vo);

	// 회원가입하기
	public int join(MemberVO vo);

	// 아이디체크하기
	public MemberVO getMemberChk(MemberVO vo);

	// 로그인한 회원정보를 회원정보수정양식에 띄우기.
	public MemberVO myinfo(MemberVO vo);
	
	// 회원정보수정하기
	public void mupdate(MemberVO vo);
//	public int mupdate(MemberVO vo);
	
	/*
	 * 로그인했을 때 생생된 세션값을 회원정보수정창에 넘기면 안됨... public HttpSession myinfo(HttpSession
	 * session);
	 */
	public void mdelete(MemberVO vo);
	
	public void insertVisitDate(MemberVO vo);
	
}
