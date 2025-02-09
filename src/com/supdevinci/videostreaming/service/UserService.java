package com.supdevinci.videostreaming.service;



import java.sql.SQLException;

import com.supdevinci.videostreaming.bean.UserBean;
import com.supdevinci.videostreaming.bean.UserPreferenceBean;
import com.supdevinci.videostreaming.dao.UserDao;
import com.supdevinci.videostreaming.exception.ServiceException;



public class UserService {
	
	UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public UserBean seConnecter(String identifiant, String motDePasse) throws ServiceException {
		UserBean user = null;
		try {
			user = userDao.recupererUser(identifiant);
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServiceException(e, "Erreur : conexion base de donn�es non �tablie");
		}
		if(user == null) {
			throw new ServiceException( "Erreur : identifiant erron�");
		}
		else if(!motDePasse.contentEquals(user.getMotDePasse())) {
			throw new ServiceException( "Erreur : mot de passe erron�");
		} 
		return user;
	}

	public UserPreferenceBean recuepererUserPreferences(int userId) throws ClassNotFoundException, SQLException {
		UserPreferenceBean userPreference = userDao.recuepererUserPreferences(userId);
		return userPreference;
	}

	public void enregisterUserPrefrences(UserPreferenceBean userPreference) {
		// TODO Auto-generated method stub
		
	}
	
}
