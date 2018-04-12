package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcb.model.Email;
import com.rcb.service.EmailService;

/**
 * Servlet implementation class SendServlet
 */
@WebServlet("/send")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Email email = new Email();
		email.setEmail(request.getParameter("email").toString());
		email.setBody(request.getParameter("text").toString());

		EmailService es = new EmailService();
		es.SendingEmail(email);

	}

}
