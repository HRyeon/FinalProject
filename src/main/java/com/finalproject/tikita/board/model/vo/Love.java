package com.finalproject.tikita.board.model.vo;

public class Love {
	
	private int mNum;
	private int bNum;
	private int lDate;
	
	public Love() {}

	public Love(int mNum, int bNum) {
		super();
		this.mNum = mNum;
		this.bNum = bNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	
	public int getlDate() {
		return lDate;
	}

	public void setlDate(int lDate) {
		this.lDate = lDate;
	}

	@Override
	public String toString() {
		return "Love [mNum=" + mNum + ", bNum=" + bNum + "]";
	}
	
}
