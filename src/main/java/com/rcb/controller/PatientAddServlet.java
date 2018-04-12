package com.rcb.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.rcb.model.Email;
import com.rcb.model.Patient;
import com.rcb.model.User;
import com.rcb.service.EmailService;
import com.rcb.service.PatientService;
import com.rcb.service.UserService;

/**
 * Servlet implementation class DocterAddServlet2
 */
@WebServlet("/patientAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class PatientAddServlet extends HttpServlet {
	private static final String SAVE_DIR = "IMG";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		Patient patient = new Patient();
		// PrintWriter out = response.getWriter();
		String savePath = "D:/tecnosoft_JAVA_EE/workshop//RCB_MRS/src/main/webapp/static/" + SAVE_DIR + "/";

		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		Part part = request.getPart("file");
		String fileName = extractFileName(part);

		part.write(savePath + fileName);

		String filePath = savePath + fileName;
		// System.out.println("file path =" + filePath);
		// System.out.println("database path =" + "static/" + SAVE_DIR + "/" +
		// fileName);

		// ----------------------
		patient.setType_id(3);
		patient.setP_fname(request.getParameter("txtFname"));
		patient.setP_lname(request.getParameter("txtLname"));
		patient.setP_nic(request.getParameter("txtNic"));
		patient.setP_email(request.getParameter("txtEmail"));
		patient.setP_gender(request.getParameter("gender"));
		patient.setP_dob(request.getParameter("dob"));
		patient.setP_job(request.getParameter("txtJob"));
		patient.setP_blood(request.getParameter("bloodGroup"));
		patient.setP_marital(request.getParameter("status"));
		patient.setP_haddress(request.getParameter("homeAdd"));
		patient.setP_tel(request.getParameter("number"));
		patient.setImg_path("static/" + SAVE_DIR + "/" + fileName);
		// System.out.println(docter.getImg_path() + "xxxxxxxxxx");

		String action = request.getParameter("btnSubmit");

		if (action.equals("save")) {
			PatientService regPatient = new PatientService();

			boolean result1 = regPatient.putPatientData(patient);

			User user = new User();
			user.setEmail(patient.getP_email());
			user.setP_id(regPatient.getPatientLastId());
			user.setUser_type(3);
			user.setUser_img_path(patient.getImg_path());
			regPatient.putPatientUSerData(user);

			// -----------email send
			Email email = new Email();
			EmailService emailService = new EmailService();
			email.setEmail(patient.getP_email());
			UserService us = new UserService();
			email.setBody("Sucessfully Registered !!! \n Please Create Your Login Account\n"
					+ "http://localhost:9090/RCB_MRS//sendUserId?id=" + us.getLastUserId());
			email.setSubject("RCB MRS New Request For Creating a User Accout");
			emailService.SendingEmail(email);

			if (result1) {
				// System.out.println("sucess add ");
				response.sendRedirect("PatientList.jsp");

			}
		}

		// fu.saveFile(firstName, lastName, filePath);

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return "rcb_" + s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("btnSubmit");

		if (action.equals("cancle")) {
			PatientService regPatient = new PatientService();

			response.sendRedirect("DashBoard.jsp");

		}

	}
}
