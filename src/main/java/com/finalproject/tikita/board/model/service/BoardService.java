package com.finalproject.tikita.board.model.service;

import java.util.ArrayList;

import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.board.model.vo.Love;
import com.finalproject.tikita.board.model.vo.PageInfo;

public interface BoardService {

	//int getSearchListCount();
	//ArrayList<Board> selectSearchList(PageInfo pi, String search);

	ArrayList<Board> selectSearchList(String search);

	ArrayList<String> selectTagList(ArrayList<Board> blist);

	ArrayList<String> selectBoardTagList(int getbNum);

	ArrayList<String> selectTagSearchList(String search);

	ArrayList<Board> selectTagBoardList(String search);

	// 본주
	int getTrackCount(int mNum); 
	int getLikeCount(int mNum); 
	int getLikedCount(int mNum); 
	int getBoardLikeCount(int bNum); 
	ArrayList<Board> getBoardLikeList(int mNum);


	//mainlist (mainfeed)
	ArrayList<Board> feedList(int mNum); 
	ArrayList<Board> getAllMyList(int mNum);	
	ArrayList<Board> getAllLikeList(int mNum);
	int getFeedLikeCount(int bNum); 
	int getFeedReplyCount(int bNum);

	//feedDetail (게시물 상세페이지)
	Board feedDetail(int bNum); 
	int boardWrite (Board b);
	
	// 좋아요 관련
	int insertLike(Love l);
	int deleteLike(Love l);
	ArrayList<Integer> myLoveblist(int sessionId);

	int boardDelete(int bNum);

	void insertTag(String tName);

	ArrayList<Board> bestList();

	int insertLoveAlarm(Alarm a);

	void insertFollowAlarm(Alarm a);

	ArrayList<Alarm> alarmList(int mNum);

	int updateAlarm(int aNum);
}
