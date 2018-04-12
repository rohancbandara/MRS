package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcb.model.User;

/**
 * Servlet implementation class SendUserIdServlet
 */
@WebServlet("/sendUserId")
public class SendUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		int user_id = Integer.parseInt(request.getParameter("id"));
		user.setUser_id(user_id);
		response.sendRedirect("UserRegistration.jsp");
		HttpSession session = request.getSession();
		session.setAttribute("u_id", user.getUser_id());

	}

}
