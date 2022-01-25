package com.supdevinci.videostreaming.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.supdevinci.videostreaming.bean.NotationBean;

public class NotationDao extends Dao {

	public int creerNotation(NotationBean notation) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		
		Connection connexion = null;
		PreparedStatement statement = null;
		int resultat = 0;
		try {
			int id = 1 + this.recupererIdMaxNoation();
			connexion =  ouvrirConnexion();
			String sql = "insert into vs_notation (id, note, commentaire, userId, videoId)" 
					+ " values (?, ?, ?, ?, ?);";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, id);
			statement.setInt(2, notation.getNote());
			statement.setString(3, notation.getCommentaire());
			statement.setInt(4, notation.getUser().getId());
			statement.setInt(5, notation.getVideo().getId());
			resultat = statement.executeUpdate();
		}finally {
            fermerConnexion(connexion, statement, null);
        }
		return resultat;
		
	}

	public int majNotation(NotationBean notation) throws ClassNotFoundException, SQLException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement statement = null;
		int resultat = 0;
		try {
			connexion =  ouvrirConnexion();
			String sql = "update vs_notation set note=?, commentaire=? where id=?;" ;
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, notation.getNote());
			statement.setString(2, notation.getCommentaire());
			statement.setInt(3, notation.getId());
			resultat = statement.executeUpdate();
		}finally {
            fermerConnexion(connexion, statement, null);
        }
		return resultat;
	}

	public NotationBean recupererNote(int userId, int videoId) throws SQLException, ClassNotFoundException {
		super.chargerDriver();
		Connection connexion = null;
		PreparedStatement  statement = null;
		ResultSet resultat = null;
		
		try {
			connexion =  super.ouvrirConnexion();
			String sql = "select id, note, commentaire from vs_notation where userId=? and videoId=?;";
			statement = connexion.prepareStatement(sql);
			statement.setInt(1, userId);
			statement.setInt(2, videoId);
			resultat= statement.executeQuery();
			if(resultat.next()) {
				return mapperNotation(resultat);
			}
		}finally {
            super.fermerConnexion(connexion, statement, resultat);
        }
		return null;
	}
	
	private NotationBean mapperNotation(ResultSet resultat) throws SQLException {
		NotationBean notation = new NotationBean();
		notation.setId(resultat.getInt("id"));
		notation.setNote(resultat.getInt("note"));
		notation.setCommentaire(resultat.getString("commentaire"));
		return notation;
	}

	private int recupererIdMaxNoation() throws SQLException {
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		try {
			connexion =  ouvrirConnexion();
			statement = connexion.createStatement();
			resultat = statement.executeQuery("select max(id) from vs_notation;");
			if(resultat.next()) {
				return resultat.getInt(1);
			}
		} finally {
            fermerConnexion(connexion, statement, resultat);
        }
		return 0;
	}

}
