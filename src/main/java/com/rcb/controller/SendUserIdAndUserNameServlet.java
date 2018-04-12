package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcb.model.User;

/**
 * Servlet implementation class SendUserIdServlet
 */
@WebServlet("/sendUserIdAndName")
public class SendUserIdAndUserNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		user.setUser_name(request.getParameter("uname").toString());
		System.out.println(user.getUser_name());

	}

}
