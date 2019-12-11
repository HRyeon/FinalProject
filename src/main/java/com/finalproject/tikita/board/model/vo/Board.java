package com.finalproject.tikita.board.model.vo;

import java.util.ArrayList;

public class Board {

	private int bNum;			// 게시글 번호
	private String bContent;	// 게시글 내용
	private String bDate;		// 게시 날짜
	private String bArtist;		// 가수 이름
	private char bStatus;		// 삭제 여부
	private String bTitle;		// 게시글 이름(음악 이름)
	private String bImgName;		// 음악 이미지파일 이름
	private String bFileName;	// 음악파일 이름
	
	private int mNum; 			// 회원번호(업로드한 회원) 
	private String mNick;		// 회원 닉네임
	private String mProfile;
	private boolean llike = false;		// 좋아요 여부
	private int lCount;			// 좋아요 개수
	private int rCount; 		// 댓글 개수
	
	private ArrayList<String> tlist;

	public Board() { 
		this.llike = false;
	}
	
	public Board(int bNum, String bContent, String bDate, String bArtist, char bStatus, String bTitle, String bImgName,
			String bFileName, int mNum, String mNick, String mProfile, boolean llike, int lCount, int rCount,
			ArrayList<String> tlist) {
		super();
		this.bNum = bNum;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bArtist = bArtist;
		this.bStatus = bStatus;
		this.bTitle = bTitle;
		this.bImgName = bImgName;
		this.bFileName = bFileName;
		this.mNum = mNum;
		this.mNick = mNick;
		this.mProfile = mProfile;
		this.llike = llike;
		this.lCount = lCount;
		this.rCount = rCount;
		this.tlist = tlist;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public String getbArtist() {
		return bArtist;
	}

	public void setbArtist(String bArtist) {
		this.bArtist = bArtist;
	}

	public char getbStatus() {
		return bStatus;
	}

	public void setbStatus(char bStatus) {
		this.bStatus = bStatus;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbImgName() {
		return bImgName;
	}

	public void setbImgName(String bImgName) {
		this.bImgName = bImgName;
	}

	public String getbFileName() {
		return bFileName;
	}

	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getmProfile() {
		return mProfile;
	}

	public void setmProfile(String mProfile) {
		this.mProfile = mProfile;
	}

	public boolean isLlike() {
		return llike;
	}

	public void setLlike(boolean llike) {
		this.llike = llike;
	}

	public ArrayList<String> getTlist() {
		return tlist;
	}

	public void setTlist(ArrayList<String> tlist) {
		this.tlist = tlist;
	}

	public int getlCount() {
		return lCount;
	}

	public void setlCount(int lCount) {
		this.lCount = lCount;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bContent=" + bContent + ", bDate=" + bDate + ", bArtist=" + bArtist
				+ ", bStatus=" + bStatus + ", bTitle=" + bTitle + ", bImgName=" + bImgName + ", bFileName=" + bFileName
				+ ", mNum=" + mNum + ", mNick=" + mNick + ", mProfile=" + mProfile + ", llike=" + llike + ", lCount="
				+ lCount + ", rCount=" + rCount + ", tlist=" + tlist + "]";
	}
	
	
	
}