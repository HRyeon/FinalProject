package com.finalproject.tikita.member.model.service;

import java.util.ArrayList;

import com.finalproject.tikita.member.model.vo.Follow;
import com.finalproject.tikita.member.model.vo.Member;

public interface MemberService {

	ArrayList<Member> selectSearchList(String search);
	
	Member getMemberInfo(int mNum);
	int getFollowerCount(int mNum);	
	int getFollowingCount(int mNum);	
 
	ArrayList<Member> getFollowerList(int mNum);
	ArrayList<Member> getFollowingList(int mNum);

	void updateInfo(Member mLogin); 

	void inputInfo(Member mLogin);

	//팔로우,언팔로우 상태 확인후 버튼바꾸는부분
	int followCheck(Follow followCheck); 

	int addFollow(Follow f); //팔로우

	int deleteFollow(Follow f); //언팔로우

	int selectAmem(int bNum);

	
}
