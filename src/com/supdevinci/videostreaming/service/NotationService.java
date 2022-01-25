package com.supdevinci.videostreaming.service;

import java.sql.SQLException;

import com.supdevinci.videostreaming.bean.NotationBean;
import com.supdevinci.videostreaming.bean.UserBean;
import com.supdevinci.videostreaming.bean.VideoBean;
import com.supdevinci.videostreaming.dao.NotationDao;
import com.supdevinci.videostreaming.exception.ServiceException;

public class NotationService {

	NotationDao notationDao;
	
	public NotationService () {
		notationDao = new NotationDao();
	}
	
	public void noterVideo(NotationBean notation) throws ServiceException {
		if(notation == null || notation.getNote() == 0) {
			throw new ServiceException("erreur : la note est null ou 0");
		}

		UserBean user = notation.getUser();
		VideoBean video = notation.getVideo();
		if(user == null || video == null) {
			throw new ServiceException("erreur : la video ou le user est null ");
		}

		try {
			if(notation.getId()!=0) {
				notationDao.majNotation(notation);
			} else {
				notationDao.creerNotation(notation);
			}
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServiceException("erreur : accès base de données ");
		}
	}
}
	
