package com.supdevinci.videostreaming.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.supdevinci.videostreaming.bean.UserBean;

@WebFilter("/ConnexionFilter")
public class ConnexionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		HttpSession session = req.getSession(false);
		UserBean user = session != null ? (UserBean) session.getAttribute("currentUser") : null;

		if (user == null && !(uri.endsWith("html") || uri.endsWith("connexion"))) {
			res.sendRedirect("connexion");
		} else {
			chain.doFilter(request, response);
		}

	}

}
