package com.finalproject.tikita.member.model.vo;

public class Follow {
	
	private int following;
	private int followed;
	private String fdate;
	
	public Follow() {}
	
	
	public Follow(int following, int followed, String fdate) {
		super();
		this.following = following;
		this.followed = followed;
		this.fdate = fdate;
	}

	
	public int getFollowing() {
		return following;
	}

	public void setFollowing(int following) {
		this.following = following;
	}

	public int getFollowed() {
		return followed;
	}

	public void setFollowed(int followed) {
		this.followed = followed;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}


	@Override
	public String toString() {
		return "Follow [following=" + following + ", followed=" + followed + ", fdate=" + fdate + "]";
	}
	
	

	
	
	
	
	
	

}