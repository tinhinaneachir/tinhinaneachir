package com.supdevinci.videostreaming.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supdevinci.videostreaming.bean.UserBean;
import com.supdevinci.videostreaming.bean.UserPreferenceBean;
import com.supdevinci.videostreaming.bean.VideoBean;
import com.supdevinci.videostreaming.exception.ServiceException;
import com.supdevinci.videostreaming.service.UserService;
import com.supdevinci.videostreaming.service.VideoService;

@WebServlet("/moncompte")
public class MonCompteServlet extends HttpServlet{
	
	final static String OP_VIDEO_FAVORITE_SUPPRESSION = "vf_suppression";
	
	UserService userService;
	VideoService videoService;
	
	public MonCompteServlet() {
		super();
		userService = new UserService();
		videoService = new VideoService();
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
		String op = (String) request.getParameter("op");
		String idVideo = (String) request.getParameter("idVideo");
		UserBean user =  (UserBean) request.getSession().getAttribute("currentUser");
		if(OP_VIDEO_FAVORITE_SUPPRESSION.contentEquals(op)) {
			
			
			
		}
		doGet( request,  response);
	}

}
