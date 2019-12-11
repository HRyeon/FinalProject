package com.finalproject.tikita.playlist.model.vo;

import java.util.ArrayList;

import com.finalproject.tikita.board.model.vo.Board;

public class Playlist {
	
	private int pNum;		// 플레이리스트 번호
	private String pName;	// 플레이리스트 이름
	private int mNum;		// 리스트 주인
	private String mNick;	// 리스트 주인 별명
	private int pOrder;		// 곡의 순서
	private int bNum;		// 글 번호
	private String bArtist;
	private String bTitle;  // 노래 제목
	private String bFilename; // 노래 파일 경로
	private String mProfile; //리스트 주인 프로필이미지
	private ArrayList<Board> blist;	
	private String pImg;	// 플레이리스트 대표 이미지
	
	public Playlist() { }

	
	public Playlist(int bNum, String bTitle, String bFilename) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bFilename = bFilename;
		
	}
	
	public Playlist(int bNum, String bTitle, String bFilename, String bArtist) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bFilename = bFilename;
		this.bArtist = bArtist;
	}



	public Playlist(int pNum, String pName, int mNum, String mNick, ArrayList<Board> blist) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.mNum = mNum;
		this.mNick = mNick;
		this.blist = blist;
	}
	
	public Playlist(int pNum, String pName, int mNum, int pOrder, int bNum, String bTitle, String bFilename, String mProfile) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.mNum = mNum;
		this.pOrder = pOrder;
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bFilename = bFilename;
		this.mProfile = mProfile;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public ArrayList<Board> getBlist() {
		return blist;
	}

	public void setBlist(ArrayList<Board> blist) {
		this.blist = blist;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	
	

	public int getpOrder() {
		return pOrder;
	}

	public void setpOrder(int pOrder) {
		this.pOrder = pOrder;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbFilename() {
		return bFilename;
	}

	public void setbFilename(String bFilename) {
		this.bFilename = bFilename;
	}

	public String getmProfile() {
		return mProfile;
	}

	public void setmProfile(String mProfile) {
		this.mProfile = mProfile;
	}

	
	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}



	@Override
	public String toString() {
		return "Playlist [pNum=" + pNum + ", pName=" + pName + ", mNum=" + mNum + ", mNick=" + mNick + ", pOrder="
				+ pOrder + ", bNum=" + bNum + ", bTitle=" + bTitle + ", bFilename=" + bFilename + ", mProfile="
				+ mProfile + ", blist=" + blist + ", pImg=" + pImg + "]";
	}
	
	
}
