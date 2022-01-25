package com.supdevinci.videostreaming.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supdevinci.videostreaming.bean.NotationBean;
import com.supdevinci.videostreaming.bean.UserBean;
import com.supdevinci.videostreaming.bean.UserPreferenceBean;
import com.supdevinci.videostreaming.bean.VideoBean;
import com.supdevinci.videostreaming.exception.ServiceException;
import com.supdevinci.videostreaming.service.NotationService;
import com.supdevinci.videostreaming.service.UserService;
import com.supdevinci.videostreaming.service.VideoService;

@WebServlet("/moncompte")
public class MonCompteServlet extends HttpServlet{
	
	final static String ACTION_SUPPRESSION_VIDEO_FAVORITE = "supprimer_video_favorite";
	final static String ACTION_NOTATION_VIDEO_VISIONNEE = "noter_video_visionnee";
	final static String ACTION_MODFICATION_USER_PREFERENCES = "modifier_user_preference";
	
	UserService userService;
	VideoService videoService;
	NotationService notationService;
	
	public MonCompteServlet() {
		super();
		userService = new UserService();
		videoService = new VideoService();
		notationService = new NotationService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
			List<VideoBean> videosFavorites = videoService.recupererVideosFavorites(user.getId());
			request.setAttribute("videosFavorites", videosFavorites);
			
			List<VideoBean> videosVisionnees = videoService.recupererVideosVisionnees(user.getId());
			request.setAttribute("videosVisionnees", videosVisionnees);
			
			UserPreferenceBean userPreference = userService.recuepererUserPreferences(user.getId());
			request.setAttribute("userPreference", userPreference);
			
		} catch (ServiceException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace().toString());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getServletContext().getRequestDispatcher("/WEB-INF/moncompte.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		try {
			 switch(action){
		       case ACTION_MODFICATION_USER_PREFERENCES: 
		    	   this.enregisterUserPrefrences(request);
		           break;
		       case ACTION_NOTATION_VIDEO_VISIONNEE: 
		    	   this.noterVideoVisonnee(request);
		           break;
		       case ACTION_SUPPRESSION_VIDEO_FAVORITE: 
		    	   this.supprimerVideoFavorite(request);
		           break;   
			 }
		} catch (ServiceException e) {
			// affihcer l'erreur
		} 
		doGet( request,  response);
	}

	private void noterVideoVisonnee(HttpServletRequest request) {
		int idVideo = convertirInt((String) request.getParameter("idVideo"));
		if(idVideo!= 0 ) {
			NotationBean notation = new NotationBean();
			notation.setId(convertirInt(request.getParameter("idNotation")));
			notation.setNote(convertirInt(request.getParameter("note")));
			notation.setCommentaire(request.getParameter("commentaire"));
			UserBean user =  (UserBean) request.getSession().getAttribute("currentUser");
			notation.setUser(user);
			VideoBean video = new VideoBean();
			notation.setVideo(video);
			video.setId(idVideo);
			try {
				notationService.noterVideo(notation);
			} catch (ServiceException e) {
				//afficher l'erreur
			}
		} 
		
	}

	private void supprimerVideoFavorite(HttpServletRequest request) throws ServiceException {
		int idVideo = convertirInt((String) request.getParameter("idVideo"));
		if(idVideo!= 0 ) {
			UserBean user =  (UserBean) request.getSession().getAttribute("currentUser");
			videoService.supprimerVideoFavorite(idVideo, user.getId());
		} 
		
	}

	private void enregisterUserPrefrences(HttpServletRequest request) {
		UserPreferenceBean userPrefrence = new UserPreferenceBean();
		userPrefrence.setGenre(request.getParameter("genre"));
		userPrefrence.setTypeVideo(request.getParameter("typeVideo"));	
		userPrefrence.setLangue(request.getParameter("langue"));	
 	   	userService.enregisterUserPrefrences( userPrefrence);
	}

	private int convertirInt(String valeur) {
		try {
			return Integer.parseInt(valeur);
		} catch(Exception e) {
			return 0;
		}
	}

}
