package com.supdevinci.streamingvideo.bean;

import java.util.Date;

public class VideoFavoriteBean {
	
	private int id;
	private VideoBean video;
	private UserBean user;
	private Date date;
	
	/*getters et settrers*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public VideoBean getVideo() {
		return video;
	}
	public void setVideo(VideoBean video) {
		this.video = video;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
