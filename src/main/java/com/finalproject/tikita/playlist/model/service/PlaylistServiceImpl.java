package com.finalproject.tikita.playlist.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.playlist.model.dao.PlaylistDAO;
import com.finalproject.tikita.playlist.model.vo.Playlist;

@Service("pService")
public class PlaylistServiceImpl implements PlaylistService{
	
	@Autowired
	private PlaylistDAO pDAO;

	@Override
	public ArrayList<Playlist> selectSearchList(String search) {
		return pDAO.selectSearchList(search);
	}

	@Override
	public ArrayList<Board> selectPlaylistBoardList(int getpNum) {
		return pDAO.selectPlaylistBoardList(getpNum);
	}
	
	@Override
	public ArrayList<Playlist> selectList(int mNum) {
		
		return pDAO.selectList(mNum);
	}

	@Override
	public int makeppppp(int mNum) {
		return pDAO.makeppppp(mNum);
		
	}

	@Override
	public ArrayList<Playlist> getPlaylist(int mNum) {
		return pDAO.getPlaylist(mNum);
	}

	@Override
	public int addPlaylist(Playlist playlist) {
		return pDAO.addPlaylist(playlist);
	}

	@Override
	public Playlist playlistDetail(int pNum) {
		return pDAO.playlistDetail(pNum);
	}

	@Override
	public int playlistDelete(int pNum) {
		return pDAO.playlistDelete(pNum);
		
	}

	 @Override
	   public int insertPlaylistBoard(Playlist playlist) {
	      return pDAO.insertPlaylistBoard(playlist);
	   }

	   @Override
	   public int deletePlaylistBoard(int pNum) {
	      return pDAO.deletePlaylistBoard(pNum);
	   }
	
	@Override
	public ArrayList<Playlist> plistbyId(int mNum) {
		return pDAO.plistbyId(mNum);
	}
	
	@Override
	public int getPNum(int mNum) {
	
		return pDAO.getPNum(mNum);
	}

	@Override
	public int deletePlaylist(Playlist num) {
		
		return pDAO.deletePlaylist(num);
	}

	@Override
	public int updatePlaylist(int wNum) {
		
		return pDAO.updatePlaylist(wNum);
	}


	@Override
	public ArrayList<Playlist> getPlaylistBoard(int pNum) {
		 
		return pDAO.getPlaylistBoard(pNum);
	}

	@Override
	public Playlist checkpname(Playlist playlist) {
		 
		return pDAO.checkpname(playlist);
	}

	

	
}
