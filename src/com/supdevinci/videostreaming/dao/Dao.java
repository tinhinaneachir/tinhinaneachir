package com.supdevinci.videostreaming.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Dao {
	

	  private DataSource dataSource;
	  
	
	
	protected Connection ouvrirConnexion() throws SQLException {
		try {

			System.setProperty("h2.clientTraceDirectory", "/h2db");
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)
			  envCtx.lookup("vs-database");
			return ds.getConnection();
		} catch (Exception e) {
			return null;
		}
		//return DriverManager.getConnection("jdbc:mysql://localhost:3306/vs_videostreaming?"  
		//					+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root","root");
	}
	
	protected void chargerDriver() throws ClassNotFoundException {
		//Class.forName("com.mysql.jdbc.Driver");
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
