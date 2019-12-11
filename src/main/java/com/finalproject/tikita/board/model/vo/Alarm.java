package com.finalproject.tikita.board.model.vo;

public class Alarm {

	private int aNum;
	private int mNum;
	private int target_mNum;
	private String aType;
	private int bNum;
	private String aUrl;
	private String aDate;
	private String aStatus;
	private String mNick;
	private String mProfile;
	
	public Alarm() { }


	public Alarm(int aNum, int mNum, int target_mNum, String aType, int bNum, String aUrl, String aDate, String aStatus,
			String mNick, String mProfile) {
		super();
		this.aNum = aNum;
		this.mNum = mNum;
		this.target_mNum = target_mNum;
		this.aType = aType;
		this.bNum = bNum;
		this.aUrl = aUrl;
		this.aDate = aDate;
		this.aStatus = aStatus;
		this.mNick = mNick;
		this.mProfile = mProfile;
	}



	public Alarm(int aNum, int mNum, int target_mNum, String aType, int bNum, String aUrl, String aDate,
			String aStatus) {
		super();
		this.aNum = aNum;
		this.mNum = mNum;
		this.target_mNum = target_mNum;
		this.aType = aType;
		this.bNum = bNum;
		this.aUrl = aUrl;
		this.aDate = aDate;
		this.aStatus = aStatus;
	}
	
	public Alarm(int mNum, int target_mNum, String aType, int bNum, String aUrl) {
		super();
		this.mNum = mNum;
		this.target_mNum = target_mNum;
		this.aType = aType;
		this.bNum = bNum;
		this.aUrl = aUrl;
	}
	
	public Alarm(int mNum, int target_mNum, String aType, String aUrl) {
		super();
		this.mNum = mNum;
		this.target_mNum = target_mNum;
		this.aType = aType;
		this.aUrl = aUrl;
	}

	public int getaNum() {
		return aNum;
	}

	public void setaNum(int aNum) {
		this.aNum = aNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getTarget_mNum() {
		return target_mNum;
	}

	public void setTarget_mNum(int target_mNum) {
		this.target_mNum = target_mNum;
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getaUrl() {
		return aUrl;
	}

	public void setaUrl(String aUrl) {
		this.aUrl = aUrl;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
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
		return "Alarm [aNum=" + aNum + ", mNum=" + mNum + ", target_mNum=" + target_mNum + ", aType=" + aType
				+ ", bNum=" + bNum + ", aUrl=" + aUrl + ", aDate=" + aDate + ", aStatus=" + aStatus + ", mNick=" + mNick
				+ ", mProfile=" + mProfile + "]";
	}
	

		
}