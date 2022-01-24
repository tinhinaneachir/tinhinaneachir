package com.supdevinci.streamingvideo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.supdevinci.streamingvideo.bean.UserBean;
import com.supdevinci.streamingvideo.bean.UserPreferenceBean;


public class UserDao extends Dao{
	
	public UserBean recupererUser(String identifiant) throws SQLException, ClassNotFoundException{
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement  statement = null;
		ResultSet resultat = null;
		
		try {
			connexion =  super.ouvrirConnexion();
			String sql = "select id, nom, prenom, identifiant, motDePasse, email, photo FROM vs_user where identifiant=?";
			statement = connexion.prepareStatement(sql);
			statement.setString(1, identifiant);
			resultat= statement.executeQuery();
			if(resultat.next()) {
				return mapperUser(resultat);
			}
		}finally {
            super.fermerConnexion(connexion, statement, resultat);
        }
		return null;
	}

	public UserPreferenceBean recuepererUserPreferences(int id) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement  statement = null;
		ResultSet resultat = null;
		
		try {
			connexion =  super.ouvrirConnexion();
			String sql = "select id, typeVideo, langue, genre FROM vs_user_preference where Id=?";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, id);
			resultat= statement.executeQuery();
			if(resultat.next()) {
				return mapperUserPreference(resultat);
			}
		}finally {
            super.fermerConnexion(connexion, statement, resultat);
        }
		return null;
	}

	private UserBean mapperUser(ResultSet resultat) throws SQLException {
		UserBean user = new UserBean();
		user.setId(resultat.getInt("id"));
		user.setNom(resultat.getString("nom"));
		user.setPrenom(resultat.getString("prenom"));
		user.setIdentifiant(resultat.getString("identifiant"));
		user.setMotDePasse(resultat.getString("motDePasse"));
		user.setEmail(resultat.getString("email"));
		user.setPhoto(resultat.getString("photo"));
		return user;
	}

	private UserPreferenceBean mapperUserPreference(ResultSet resultat) throws SQLException {
		UserPreferenceBean user = new UserPreferenceBean();
		user.setId(resultat.getInt("id"));
		user.setGenre(resultat.getString("genre"));
		user.setLangue(resultat.getString("langue"));
		user.setTypeVideo(resultat.getString("typeVideo"));
		return user;
	}
}