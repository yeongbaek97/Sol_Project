package com.sol.pj.member;

import java.util.List;

public interface MemberMapper {

	public Member getMemberByID(Member m);

	public int modifyInfo(Member m);
	
}
