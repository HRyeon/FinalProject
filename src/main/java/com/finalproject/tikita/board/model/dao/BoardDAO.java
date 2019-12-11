package com.finalproject.tikita.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.board.model.vo.Love;
import com.finalproject.tikita.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
//	public int getSearchListCount() {
//		
//		return sqlSession.selectOne("boardMapper.getSearchListCount");
//	}

//	public ArrayList<Board> selectSearchList(PageInfo pi, String search) {
//		
//		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", null, rowBounds);
//	}
	
	// 검색결과로 게시물 조회
	public ArrayList<Board> selectSearchList(String search) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", search);
	}

	// 미완성
	public ArrayList<String> selectTagList(ArrayList<Board> blist) {
		return null;
	}

	// bNum으로 게시물 내의 태그 리스트 조회
	public ArrayList<String> selectBoardTagList(int getbNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardTagList", getbNum);
	}

	// 검색결과(search)로 태그명 조회
	public ArrayList<String> selectTagSearchList(String search) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTagSearchList", search);
	}

	// 검색결과로 태그가 포함된 게시물 조회
	public ArrayList<Board> selectTagBoardList(String search) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTagBoardList", search);
	}

	// +10.16
	public int getTrackCount(int mNum) {
		return sqlSession.selectOne("boardMapper.getTrackCount",mNum);
	}
	public int getLikeCount(int mNum) {
		return sqlSession.selectOne("boardMapper.getLikeCount",mNum);
	}
	public int getLikedCount(int mNum) {
		return sqlSession.selectOne("boardMapper.getLikedCount",mNum);
	}
	public ArrayList<Board> getBoardLikeList (int mNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardLikeList",mNum);
	}
	public int getBoardLikeCount(int bNum) {
		return sqlSession.selectOne("boardMapper.getBoardLikeCount",bNum);
	}


	//mainfeed
	public ArrayList<Board> feedList(int mNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.feedList", mNum);
	}
	public int getFeedLikeCount(int bNum) {
		return sqlSession.selectOne("boardMapper.getFeedLikeCount",  bNum);
	}
	public int getFeedReplyCount(int bNum) {
		return sqlSession.selectOne("boardMapper.getFeedReplyCount",  bNum);
	}


	//mypagefeed 1,2
	public ArrayList<Board> getAllMyList(int mNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.getAllMyList",mNum);
	}
	public ArrayList<Board> getAllLikeList(int mNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.getAllLikeList",mNum);
	}

	//feedDetail(게시물상세페이지)
	public Board feedDetail(int bNum) {
		return sqlSession.selectOne("boardMapper.feedDetail",bNum);
	}

	public int boardWrite(Board b) {
		return sqlSession.insert("boardMapper.boardWrite",b);
	} 
	
	// 좋아요 관련
	public int insertLike(Love l) {
		return sqlSession.insert("boardMapper.insertLike",l);
	}

	public int deleteLike(Love l) {
		return sqlSession.delete("boardMapper.deleteLike",l);
	}

	public ArrayList<Integer> myLoveblist(int sessionId) {
		return (ArrayList)sqlSession.selectList("boardMapper.myLoveblist",sessionId);
	}

	public int boardDelete(int bNum) {
		return sqlSession.update("boardMapper.boardDelete",bNum);
	}

	public Object insertTag(String tName) {
		return sqlSession.insert("boardMapper.insertTag",tName);
	}

	public ArrayList<Board> bestList() {
		return (ArrayList)sqlSession.selectList("boardMapper.bestList");
	}

	public int insertLoveAlarm(Alarm a) {
		return sqlSession.insert("boardMapper.insertLoveAlarm", a);
	} 
	
	public Object insertFollowAlarm(Alarm a) {
		return sqlSession.insert("boardMapper.insertFollowAlarm",a);
	}

	public ArrayList<Alarm> alarmList(int mNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.alarmList",mNum);
	}

	public int updateAlarm(int aNum) {
		return sqlSession.update("boardMapper.updateAlarm", aNum);
	}
}
