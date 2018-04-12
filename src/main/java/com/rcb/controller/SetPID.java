package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcb.model.Patient;

/**
 * Servlet implementation class SetPID
 */
@WebServlet("/setpid")
public class SetPID extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Patient patient = new Patient();
		int pid = Integer.parseInt(request.getParameter("id"));
		patient.setP_id(pid);
		String pid2 = Integer.toString(pid);
		response.sendRedirect("PatientUpdate.jsp");
		// set pId in Patient Update jsp pase using session
		HttpSession session = request.getSession();
		session.setAttribute("pid", pid2);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
