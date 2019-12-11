package com.finalproject.tikita.member.model.vo;

public class Member {

	private int mNum;	// 회원번호
	private String mId;	// 회원 아이디
	private String mNick;	// 회원 별명
	private String mProfile;	// 회원 프로필사진 파일명
	
	public Member() { }

	public Member(int mNum, String mId, String mNick, String mProfile) {
		super();
		this.mNum = mNum;
		this.mId = mId;
		this.mNick = mNick;
		this.mProfile = mProfile;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
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

	@Override
	public String toString() {
		return "Member [mNum=" + mNum + ", mId=" + mId + ", mNick=" + mNick + ", mProfile=" + mProfile + "]";
	}
	
}
