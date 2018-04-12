package com.rcb.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcb.model.ApMail;
import com.rcb.model.Appinment;
import com.rcb.model.Email;
import com.rcb.service.AppoinmentService;
import com.rcb.service.EmailService;

/**
 * Servlet implementation class AppoinmentAddServlet
 */
@WebServlet("/appoinmentAdd")
public class AppoinmentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int pId = Integer.parseInt(request.getParameter("patient"));
		String dsp = request.getParameter("dsp");

		Appinment appoinment = new Appinment();
		HttpSession session = request.getSession();

		int aId = (int) session.getAttribute("aId");
		AppoinmentService as = new AppoinmentService();
		ApMail ap = new ApMail();
		as.getAllAppoinmentDetails(ap);

		appoinment.setId(aId);
		ap.setaId(aId);
		appoinment.setP_id(pId);
		ap.setPatient(pId);
		appoinment.setDsp(dsp);
		AppoinmentService apS = new AppoinmentService();
		boolean result = apS.setPatient(appoinment);

		ArrayList<ApMail> apList = as.getAllAppoinmentDetails(ap);

		for (int i = 0; i < apList.size(); i++) {
			System.out.println(apList.get(i));

			Email email = new Email();
			EmailService emailService = new EmailService();
			email.setEmail(apList.get(i).getPmail());

			email.setBody("Sucessfully created Appoinment !!! " + apList.get(i).getP_fname() + " "
					+ apList.get(i).getP_lname() + "  Docter is DR" + apList.get(i).getD_fname()
					+ apList.get(i).getD_lname() + "DATE " + apList.get(i).getDate() + " TIME "
					+ apList.get(i).getIntervel());

			email.setSubject("RCB MRS New Create Appoinment");
			emailService.SendingEmail(email);

		}

		if (result) {
			response.sendRedirect("AppointmentList.jsp");
		}
	}

}
