package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcb.model.User;
import com.rcb.service.EncriptionAndDecription;
import com.rcb.service.UserService;

/**
 * Servlet implementation class UserAddServlet
 */
@WebServlet("/userAdd")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		int user_id = Integer.parseInt(request.getParameter("uid"));
		System.out.println(user_id);
		user.setUser_id(user_id);
		user.setUser_name(request.getParameter("txtUname"));

		try {

			user.setUser_password(EncriptionAndDecription.encrypt(request.getParameter("txtConformPassword")));
			System.out.println(user.getUser_password());
			
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		UserService userService = new UserService();
		boolean result = userService.UpdateUser(user);

		if (result) {
			response.sendRedirect("index.jsp");
		}

	}

}
