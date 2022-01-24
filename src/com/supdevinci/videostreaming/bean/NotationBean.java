package com.supdevinci.videostreaming.bean;

public class NotationBean {
	
	private int id;
	private VideoBean video;
	private UserBean user;
	int note;
	String commentaire;
	
	
	
	/*getters et settres*/
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
	public int getNote() {
		return note;
	}
	public void setNote(int note) {
		this.note = note;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	
}
