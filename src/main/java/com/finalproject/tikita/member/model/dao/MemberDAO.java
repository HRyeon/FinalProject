package com.finalproject.tikita.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.tikita.member.model.vo.Follow;
import com.finalproject.tikita.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 검색 결과 회원 조회
	public ArrayList<Member> selectSearchList(String search) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", search);
	}
	
	
	public Member getMemberInfo(int mNum){
		
		Member m = sqlSession.selectOne("memberMapper.getMemberInfo", mNum); 
		return m;
	} 
	
	public int getFollowerCount(int mNum) {		 
		return sqlSession.selectOne("memberMapper.getFollowerCount",mNum);
	}
	
	public int getFollowingCount(int mNum) {
		return sqlSession.selectOne("memberMapper.getFollowingCount",mNum);
	}
	
	public ArrayList<Member> getFollowerList(int mNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.getFollowerList",mNum);
	}
	public ArrayList<Member> getFollowingList(int mNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.getFollowingList",mNum);
	}
	
	public void inputInfo(Member mLogin) {
		sqlSession.insert("memberMapper.inputInfo", mLogin);		
	}
	public void updateInfo(Member mLogin) {
		  sqlSession.update("memberMapper.updateInfo", mLogin);
	}

	public int followCheck(Follow followCheck) {
		return sqlSession.selectOne("memberMapper.followCheck",followCheck);
	}
	
	public int addFollow(Follow f) {
		 return sqlSession.insert("memberMapper.addfollow",f); 
	}


	public int deleteFollow(Follow f) {
		return sqlSession.delete("memberMapper.deletefollow",f);	
	}


	public int selectAmem(int bNum) {
		return sqlSession.selectOne("memberMapper.selectAmem",bNum);	
	}


	

}
