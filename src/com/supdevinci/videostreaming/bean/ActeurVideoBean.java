package com.supdevinci.videostreaming.bean;

public class ActeurVideoBean {
	
	private int id;
	private VideoBean video;
	private ActeurBean acteur;
	
	//getters et setters
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
	public ActeurBean getActeur() {
		return acteur;
	}
	public void setActeur(ActeurBean acteur) {
		this.acteur = acteur;
	}

}
