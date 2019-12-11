package com.finalproject.tikita.playlist.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.playlist.model.vo.Playlist;

@Repository("pDAO")
public class PlaylistDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 검색결과 플레이리스트 조회
	public ArrayList<Playlist> selectSearchList(String search) {
		return (ArrayList)sqlSession.selectList("playlistMapper.selectSearchList", search);
	}

	// 플레이리스트 내에 포함된 게시물 조회
	public ArrayList<Board> selectPlaylistBoardList(int getpNum) {
		return (ArrayList)sqlSession.selectList("playlistMapper.selectPlaylistBoardList", getpNum);
	}
	
	//현재 재생목록
	public ArrayList<Playlist> selectList(int mNum) {
		// 
		return (ArrayList)sqlSession.selectList("playlistMapper.selectplayList",mNum);
	}

	public int makeppppp(int mNum) {
		// TODO Auto-generated method stub
		return sqlSession.insert("playlistMapper.makeppppp",mNum);
	}

	public ArrayList<Playlist> getPlaylist(int mNum) { 
	 
		return (ArrayList)sqlSession.selectList("playlistMapper.getplayList", mNum);
	}

	public int addPlaylist(Playlist playlist) {
		return sqlSession.insert("playlistMapper.addPlaylist",playlist);
	}

	public int insertPlaylistBoard(Playlist playlist) { 
	      return sqlSession.insert("playlistMapper.insertPlaylistBoard",playlist);
	   }

	   public int deletePlaylistBoard(int pNum) {
	       return sqlSession.delete("playlistMapper.deletePlaylistBoard",pNum);
	   }
	
	public Playlist playlistDetail(int pNum) {
		return sqlSession.selectOne("playlistMapper.playlistDetail",pNum);
				
	}

	public int playlistDelete(int pNum) {
		return sqlSession.delete("playlistMapper.playlistDelete",pNum);
	}

	public ArrayList<Playlist> plistbyId(int mNum) {
		return (ArrayList)sqlSession.selectList("playlistMapper.plistbyId",mNum);
	}
	
	public int getPNum(int mNum) {
		 
		return sqlSession.selectOne("playlistMapper.getPNum",mNum);
	}

	public int deletePlaylist(Playlist num) {
	
		return sqlSession.delete("playlistMapper.deletePlaylist", num);
	}

	public int updatePlaylist(int wNum) {
	
		return sqlSession.update("playlistMapper.updatePlaylist", wNum);
	}

	public ArrayList<Playlist> getPlaylistBoard(int pNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("playlistMapper.getPlaylistBoard", pNum);
	}

	public Playlist checkpname(Playlist playlist) {
		// TODO Auto-generated method stub
		return (Playlist)sqlSession.selectOne("playlistMapper.checkpname", playlist);
	}
	
}
