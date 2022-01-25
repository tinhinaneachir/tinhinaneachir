package com.supdevinci.videostreaming.service;

import java.sql.SQLException;
import java.util.List;

import com.supdevinci.videostreaming.bean.VideoBean;
import com.supdevinci.videostreaming.dao.VideoDao;
import com.supdevinci.videostreaming.exception.ServiceException;

public class VideoService {
	
	VideoDao videoDao;
	
	public VideoService() {
		videoDao = new VideoDao();
	}
	
	public List<VideoBean> recupererVideosFavorites(int userId) throws ServiceException {
		try {
			return videoDao.recupererVideosFavorites(userId);
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServiceException(e, "erreur : connexion � la base de donn�es");
		}
	}
	
	public List<VideoBean> recupererVideosVisionnees(int userId) throws ServiceException {
		try {
			return videoDao.recupererVideosVisionnees(userId);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			throw new ServiceException(e, "erreur : connexion � la base de donn�es");
		}
	}

	public void supprimerVideoFavorite(int idVideo, int userId) throws ServiceException {
		try {
			 videoDao.supprimerVideoFavorite(idVideo, userId);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			throw new ServiceException(e, "erreur : suppression video impossible");
		}
	}
}
