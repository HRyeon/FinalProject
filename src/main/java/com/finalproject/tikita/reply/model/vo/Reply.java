package com.finalproject.tikita.reply.model.vo;

import java.sql.Date;

public class Reply {

	int rNum;
	int bNum;
	int mNum;
	String rContent;
	Date rDate;
	int rLevel;
	int ref_rNum;
	String mNick;
	String mProfile;
	public Reply() {
		 
	}
	public Reply(int rNum, int bNum, int mNum, String rContent, Date rDate, int rLevel, int ref_rNum, String mNick,
			String mProfile) {
		super();
		this.rNum = rNum;
		this.bNum = bNum;
		this.mNum = mNum;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rLevel = rLevel;
		this.ref_rNum = ref_rNum;
		this.mNick = mNick;
		this.mProfile = mProfile;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public int getrLevel() {
		return rLevel;
	}
	public void setrLevel(int rLevel) {
		this.rLevel = rLevel;
	}
	public int getRef_rNum() {
		return ref_rNum;
	}
	public void setRef_rNum(int ref_rNum) {
		this.ref_rNum = ref_rNum;
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
		return "Reply [rNum=" + rNum + ", bNum=" + bNum + ", mNum=" + mNum + ", rContent=" + rContent + ", rDate="
				+ rDate + ", rLevel=" + rLevel + ", ref_rNum=" + ref_rNum + ", mNick=" + mNick + ", mProfile="
				+ mProfile + "]";
	}
	 
	
}
