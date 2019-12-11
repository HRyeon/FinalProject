package com.finalproject.tikita.playlist.model.service;

import java.util.ArrayList;

import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.playlist.model.vo.Playlist;

public interface PlaylistService {

	ArrayList<Playlist> selectSearchList(String search);

	ArrayList<Board> selectPlaylistBoardList(int getpNum);

	ArrayList<Playlist> selectList(int mNum);

	int makeppppp(int mNum);

	ArrayList<Playlist> getPlaylist(int mNum);

	int addPlaylist(Playlist playlist);
	
	int insertPlaylistBoard(Playlist playlist);

	   int deletePlaylistBoard(int pNum);

	Playlist playlistDetail(int pNum);

	int playlistDelete(int pNum);

	ArrayList<Playlist> plistbyId(int mNum);
	
	int getPNum(int mNum);

	int deletePlaylist(Playlist num);

	int updatePlaylist(int wNum);



	ArrayList<Playlist> getPlaylistBoard(int pNum);

	Playlist checkpname(Playlist playlist);

}
