package com.sol.pj.member;

public interface MemberMapper {

	public Member getMemberByID(Member m);
	
	public int regMember(Member m);

	public int checkIdValue(Member m);

}
