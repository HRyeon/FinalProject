package com.finalproject.tikita.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.tikita.board.model.dao.BoardDAO;
import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.board.model.vo.Love;
import com.finalproject.tikita.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;

	//	@Override
	//	public int getSearchListCount() {
	//		return bDAO.getSearchListCount();
	//	}

	//	@Override
	//	public ArrayList<Board> selectSearchList(PageInfo pi, String search) {
	//		return bDAO.selectSearchList(pi, search);
	//	}

	@Override
	public ArrayList<Board> selectSearchList(String search) {
		return bDAO.selectSearchList(search);
	}

	@Override
	public ArrayList<String> selectTagList(ArrayList<Board> blist) {
		return bDAO.selectTagList(blist);
	}

	// bNum으로 보드에 포함된 태그 검색
	@Override
	public ArrayList<String> selectBoardTagList(int getbNum) {
		return bDAO.selectBoardTagList(getbNum);
	}

	// 검색어가 포함된 태그 검색
	@Override
	public ArrayList<String> selectTagSearchList(String search) {
		return bDAO.selectTagSearchList(search);
	}

	// 태그가 포함된 게시물 검색
	@Override
	public ArrayList<Board> selectTagBoardList(String search) {
		return bDAO.selectTagBoardList(search);
	}

	@Override    
	public int getTrackCount(int mNum) {
		return bDAO.getTrackCount(mNum);
	}
	@Override
	public int getLikeCount(int mNum) {
		return bDAO.getLikeCount(mNum);
	}
	@Override
	public ArrayList<Board> getBoardLikeList(int mNum) { 
		return bDAO.getBoardLikeList(mNum);
	}
	@Override
	public int getBoardLikeCount(int bNum) {

		return bDAO.getBoardLikeCount(bNum);
	}
	@Override
	public int getLikedCount(int mNum) {
		return bDAO.getLikedCount(mNum);
	}

	//mainfeed
	@Override
	public ArrayList<Board> feedList(int mNum) {
		return bDAO.feedList(mNum);
	} 


	//mypagefeed
	@Override
	public ArrayList<Board> getAllMyList(int mNum){
		return bDAO.getAllMyList(mNum);
	}
	@Override
	public ArrayList<Board> getAllLikeList(int mNum){
		return bDAO.getAllLikeList(mNum);
	}
	@Override
	public int getFeedLikeCount(int bNum) {
		return bDAO.getFeedLikeCount(bNum);
	}
	@Override
	public int getFeedReplyCount(int bNum) {
		return bDAO.getFeedReplyCount(bNum);
	}

	
	//feedDetail(게시물상세페이지)
	@Override
	public Board feedDetail(int bNum) {
		return bDAO.feedDetail(bNum);
	}
	
	@Override
	public int boardWrite (Board b) {
		return bDAO.boardWrite(b);
	}

	@Override
	public int insertLike(Love l) {
		return bDAO.insertLike(l);
	}

	@Override
	public int deleteLike(Love l) {
		return bDAO.deleteLike(l);
	}

	@Override
	public ArrayList<Integer> myLoveblist(int sessionId) {
		return bDAO.myLoveblist(sessionId);
	}

	@Override
	public int boardDelete(int bNum) { 
		return bDAO.boardDelete(bNum);		
	}

	@Override
	public void insertTag(String tName) {
		bDAO.insertTag(tName);
	}
	
	@Override
	public ArrayList<Board> bestList() {
		return bDAO.bestList();
	}

	@Override
	public int insertLoveAlarm(Alarm a) {
		return bDAO.insertLoveAlarm(a);
	}

	@Override
	public void insertFollowAlarm(Alarm a) {
		bDAO.insertFollowAlarm(a);
	}

	@Override
	public ArrayList<Alarm> alarmList(int mNum) {
		return bDAO.alarmList(mNum);
	}
	
	@Override
	public int updateAlarm(int aNum) {
		return bDAO.updateAlarm(aNum);
	}
	
}
