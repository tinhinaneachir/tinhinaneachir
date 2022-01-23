package com.supdevinci.streamingvideo.service;

import java.sql.SQLException;
import java.util.List;

import com.supdevinci.streamingvideo.bean.VideoBean;
import com.supdevinci.streamingvideo.dao.VideoDao;
import com.supdevinci.streamingvideo.exception.ServiceException;

public class VideoService {
	
	VideoDao videoDao;
	
	public VideoService() {
		videoDao = new VideoDao();
	}
	
	public List<VideoBean> recupererListeVideos() throws ServiceException {
		try {
			return videoDao.recupererListeVideos();
		} catch (SQLException e) {
			throw new ServiceException(e, "erreur : connexion à la base de données");
		} catch (ClassNotFoundException e) {
			throw new ServiceException(e, "erreur : connexion à la base de données");
		}
	}
	
	public List<VideoBean> recupererVideosFavorites(int userId) throws ServiceException {
		try {
			return videoDao.recupererVideosFavorites(userId);
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServiceException(e, "erreur : connexion à la base de données");
		}
	}
	
	public List<VideoBean> recupererVideosVisionnees(int userId) throws ServiceException {
		try {
			return videoDao.recupererVideosVisionnees(userId);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			throw new ServiceException(e, "erreur : connexion à la base de données");
		}
	}
}
