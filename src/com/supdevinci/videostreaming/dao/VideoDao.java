package com.supdevinci.streamingvideo.dao;

import com.supdevinci.streamingvideo.bean.VideoBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;


public class VideoDao extends Dao{
	
	//----------------Liste videos-----------------
	public List<VideoBean> recupererListeVideos() throws SQLException, ClassNotFoundException{
	
		super.chargerDriver();
		
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		try {
			connexion =  ouvrirConnexion();
			statement = connexion.createStatement();
			resultat = statement.executeQuery("select titre, duree, genre, date, langue FROM vs_video;");
			return mapperListeVideo(resultat);
			
		}finally {
            // Fermeture de la connexion
            fermerConnexion(connexion, statement, resultat);
        }

    }

	//-----------------Videos favorites-------------
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
	
	//-------------------Videos visionner--------------
	public List<VideoBean> recupererVideosVisionnees(int userId) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement statement = null;
		ResultSet resultat = null;
		try {
			connexion =  ouvrirConnexion();
			String sql = "select v.id, v.titre, v.duree, v.genre, v.date, v.langue, v.lien FROM vs_video_visionnee as vv"
					+ " left join vs_video as v on v.id = vv.videoId"
					+ " where vv.userId=?;";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, userId);
			resultat = statement.executeQuery();
			return mapperListeVideo(resultat);
		}finally {
            fermerConnexion(connexion, statement, resultat);
        }
	}
	
	//-----------------mapper  liste videos-----------------
	private List<VideoBean> mapperListeVideo(ResultSet resultat) throws SQLException {
		List<VideoBean> listeVideos = new ArrayList<VideoBean>();
		while(resultat.next()) {
			VideoBean video = new VideoBean();
			video.setId(resultat.getInt("id"));
			video.setTitre(resultat.getString("titre"));
			video.setDuree(resultat.getInt("duree"));
			video.setGenre(resultat.getString("genre"));
			video.setDateCreation(resultat.getDate("date"));
			video.setLangue(resultat.getString("langue"));
			video.setLien(resultat.getString("lien"));
			listeVideos.add(video);		
		}
		return listeVideos;
	}
}
