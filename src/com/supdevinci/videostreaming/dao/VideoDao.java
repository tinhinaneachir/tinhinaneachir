package com.supdevinci.videostreaming.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

import com.supdevinci.videostreaming.bean.NotationBean;
import com.supdevinci.videostreaming.bean.VideoBean;


public class VideoDao extends Dao{
	


	public List<VideoBean> recupererVideosFavorites(int userId) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement statement = null;
		ResultSet resultat = null;
		try {
			connexion =  ouvrirConnexion();
			String sql = "select v.id, v.titre, v.duree, v.genre, v.date, v.langue, v.lien FROM vs_video_favorite as vf"
					+ " left join vs_video as v on v.id = vf.videoId"
					+ " where vf.userId=?;";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, userId);
			resultat = statement.executeQuery();
			return mapperListeVideo(resultat);
		}finally {
            fermerConnexion(connexion, statement, resultat);
        }
	}
	
	public List<VideoBean> recupererVideosVisionnees(int userId) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement statement = null;
		ResultSet resultat = null;
		try {
			connexion =  ouvrirConnexion();
			String sql = "select v.id, v.titre, v.duree, v.genre, v.date, v.langue, v.lien, n.id as noteId, n.note, n.commentaire FROM vs_video_visionnee as vv"
					+ " left join vs_video as v on v.id = vv.videoId"
					+ " left join vs_notation as n on n.videoId = vv.videoId and n.userId = vv.userId"
					+ " where vv.userId=?;";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, userId);
			resultat = statement.executeQuery();
			return mapperListeVideoAvecNote(resultat);
		}finally {
            fermerConnexion(connexion, statement, resultat);
        }
	}
	
	public int supprimerVideoFavorite(int videoId, int userId) throws SQLException, ClassNotFoundException {
		super.chargerDriver();
		
		Connection connexion = null;
		PreparedStatement statement = null;
		int resultat = 0;
		try {
			connexion =  ouvrirConnexion();
			String sql = "delete from vs_video_favorite where videoId=? and userId=?;";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, videoId);
			statement.setInt(2, userId);
			resultat = statement.executeUpdate();
		}finally {
            fermerConnexion(connexion, statement, null);
        }
		return resultat;
	}
	
	private List<VideoBean> mapperListeVideo(ResultSet resultat) throws SQLException {
		List<VideoBean> listeVideos = new ArrayList<VideoBean>();
		while(resultat.next()) {
			VideoBean video = mapperVideo(resultat);
			listeVideos.add(video);		
		}
		return listeVideos;
	}
	
	private List<VideoBean> mapperListeVideoAvecNote(ResultSet resultat) throws SQLException {
		List<VideoBean> listeVideos = new ArrayList<VideoBean>();
		while(resultat.next()) {
			VideoBean video = mapperVideo(resultat);
			NotationBean notation = mapperNote(resultat);
			video.setNotation(notation);
			listeVideos.add(video);		
		}
		return listeVideos;
	}

	private NotationBean mapperNote(ResultSet resultat) throws SQLException {
		if(resultat.getInt("noteId") ==0) {
			return null;
		}
		NotationBean notation = new NotationBean();
		notation.setId(resultat.getInt("noteId"));
		notation.setNote(resultat.getInt("note"));
		notation.setCommentaire(resultat.getString("commentaire"));
		return notation;
	}

	private VideoBean mapperVideo(ResultSet resultat) throws SQLException {
		VideoBean video = new VideoBean();
		video.setId(resultat.getInt("id"));
		video.setTitre(resultat.getString("titre"));
		video.setDuree(resultat.getInt("duree"));
		video.setGenre(resultat.getString("genre"));
		video.setDateCreation(resultat.getDate("date"));
		video.setLangue(resultat.getString("langue"));
		video.setLien(resultat.getString("lien"));
		return video;
	}
}
