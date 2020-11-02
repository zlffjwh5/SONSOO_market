package com.sonsoo.service;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.MemberVO;
import com.sonsoo.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mm;

	// 로그인하기
	@Override
	public MemberVO getMember(MemberVO vo) {

		return mm.getMember(vo);
	}

	// 회원가입하기
	@Override
	public int join(MemberVO vo) {

		return mm.join(vo);

	}

	// 아이디체크하기
	@Override
	public MemberVO getMemberChk(MemberVO vo) {

		return mm.getMemberChk(vo);
	}

	// 로그인한 회원정보를 회원정보양식에 띄우기.
	@Override
	public MemberVO myinfo(MemberVO vo) {

		return mm.myinfo(vo);

	}

	/*
	 * 로그인했을 때 생성된 세션값을 회원정보수정창에 넘기면 안됨...
	 * 
	 * @Override public HttpSession myinfo(HttpSession session) { return
	 * (HttpSession) mm.myinfo(session); }
	 */
	
	// 회원정보수정하기
	@Override
	public void mupdate(MemberVO vo) {
		System.out.println("update!" + vo);
		System.out.println("passwordIsEmpty:?:"+vo.getPassword().isEmpty());
		if(vo.getPassword().isEmpty())
			mm.updateOmmitpassword(vo);
		else
			mm.mupdate(vo);
//		return mm.mupdate(vo);
	}
	
	@Override
		public void mdelete(MemberVO vo) {
			mm.mdelete(vo);
			
		}

	@Override
	public void insertVisitDate(MemberVO vo) {
		
		mm.insertVisitDate(vo);
	}

}
