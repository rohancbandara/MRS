package com.rcb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcb.service.PatientService;

/**
 * Servlet implementation class PatientDeleteServlet
 */
@WebServlet("/patientDelete")
public class PatientDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("id"));

		System.out.println(pid);

		PatientService patientService = new PatientService();
		Boolean result = patientService.deletePatient(pid);
		patientService.deletePatientUser(pid);
		if (result) {
			response.sendRedirect("PatientList.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
