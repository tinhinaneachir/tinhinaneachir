package com.supdevinci.videostreaming.bean;

import java.util.Date;

public class VideoBean {
	
	private int id;
	private String genre;
	private String titre;
	private String image;
	private String categorie;
	private Date dateCreation; 
	private int duree;
	private String langue;
	private String lien;
	
	private RealisateurBean realisateur;

	
	
	/* les getters et setters*/
	
	
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}

	public String getLangue() {
		return langue;
	}
	public void setLangue(String langue) {
		this.langue = langue;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public RealisateurBean getRealisateur() {
		return realisateur;
	}
	public void setRealisateur(RealisateurBean realisateur) {
		this.realisateur = realisateur;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getLien() {
		return lien;
	}
	public void setLien(String lien) {
		this.lien = lien;
	}


}
