package com.sol.pj.member;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

	public Member getMemberByID(Member m);
	
	public int regMember(Member m);

	public int checkIdValue(Member m);
	
	public int checkEmailValue(Member m);

	public Member findIDbyEmail(@Param("m_name") String m_name, @Param("m_email") String m_email);

	public Member findIDbyPhone(@Param("m_name") String m_name, @Param("m_number") String m_number);

	public Member findPWbyEmail(@Param("m_id") String m_id, @Param("m_email") String m_email);

	public Member findPWbyPhone(@Param("m_id") String m_id, @Param("m_number") String m_number);

	public int modifyInfo(Member m);

}
