package com.supdevinci.videostreaming.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dao {
	
	protected Connection ouvrirConnexion() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/vs_videostreaming?"  
							+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root","root");
	}
	
	protected void chargerDriver() throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	protected void fermerConnexion(Connection connexion, Statement statement, ResultSet resultat) {
		try {
		    if (resultat != null)
		        resultat.close();
		    if (statement != null)
		        statement.close();
		    if (connexion != null)
		        connexion.close();
		} catch (Exception ignore) {
		}
	}

}
