package com.supdevinci.videostreaming.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.supdevinci.videostreaming.bean.UserBean;
import com.supdevinci.videostreaming.exception.ServiceException;
import com.supdevinci.videostreaming.service.UserService;

@WebServlet("/connexion")
public class ConnexionServlet extends HttpServlet{
	
	UserService userService;
	
	public ConnexionServlet() {
		super();
		userService = new UserService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("deconnexion") != null ){  
			request.getSession().invalidate();
			response.sendRedirect("connexion");
		} else {
			request.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String identifiant = request.getParameter("identifiant");
		String motDePasse = request.getParameter("motDePasse");
		try {
			UserBean currentUser = userService.seConnecter(identifiant, motDePasse);
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", currentUser);
			session.setMaxInactiveInterval(15*60); //15mn
			response.sendRedirect("moncompte");
		} catch (ServiceException e) {
			request.setAttribute("errorMessage", e.getMessage());
			doGet(request, response);
		}
	}

}
