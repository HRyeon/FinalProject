package com.finalproject.tikita.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.tikita.member.model.dao.MemberDAO;
import com.finalproject.tikita.member.model.vo.Follow;
import com.finalproject.tikita.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public ArrayList<Member> selectSearchList(String search) {
		return mDAO.selectSearchList(search);
	}
	
	@Override
	public Member getMemberInfo(int mNum) {
		
		Member m =  mDAO.getMemberInfo( mNum);  
		return m;
	}
	@Override
	public int getFollowerCount(int mNum) {
		return mDAO.getFollowerCount(mNum);
	}
	@Override
	public int getFollowingCount(int mNum) {
		return mDAO.getFollowingCount(mNum);
	}
	
	@Override
	public ArrayList<Member> getFollowerList(int mNum) {
		return mDAO.getFollowerList(mNum);
	}
	@Override
	public ArrayList<Member> getFollowingList(int mNum) {
		return mDAO.getFollowingList(mNum);
	}

	 

	@Override
	public void inputInfo(Member mLogin) {
		mDAO.inputInfo(mLogin);
		
	}

	 
	@Override
	public void updateInfo(Member mLogin) {
		  mDAO.updateInfo(mLogin);
	}


	@Override
	public int followCheck(Follow followCheck) {
		return mDAO.followCheck(followCheck);
	}
	
	@Override
	public int addFollow(Follow f) {
		return mDAO.addFollow(f);
	}
	
	@Override
	public int deleteFollow(Follow f) {
		return mDAO.deleteFollow(f);
	}

	@Override
	public int selectAmem(int bNum) {
		return mDAO.selectAmem(bNum);
	} 


}
