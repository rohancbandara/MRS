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

import com.rcb.model.Docter;
import com.rcb.model.Email;
import com.rcb.model.Special;
import com.rcb.model.User;
import com.rcb.service.DocterService;
import com.rcb.service.EmailService;
import com.rcb.service.UserService;

@WebServlet("/addDocter")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class DocterAddServlet extends HttpServlet {
	private static final String SAVE_DIR = "IMG";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Docter docter = new Docter();

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
		System.out.println("file path =" + filePath);
		System.out.println("database path =" + "static/" + SAVE_DIR + "/" + fileName);

		Special special = new Special();
		docter.setType(2);
		docter.setIs_delete(1);
		docter.setD_FName(request.getParameter("txtFname"));
		docter.setD_LName(request.getParameter("txtLname"));
		docter.setD_email(request.getParameter("txtEmail"));
		docter.setD_special(Integer.parseInt(request.getParameter("special")));
		docter.setImg_path("static/" + SAVE_DIR + "/" + fileName);

		// System.out.println(docter.getImg_path() + "xxxxxxxxxx");

		String action = request.getParameter("btnSubmit");
		if (action.equals("save")) {

			DocterService regDocter = new DocterService();
			Boolean result = regDocter.putDocterData(docter);

			System.out.println(special.getSp_name());
			System.out.println(result);

			User user = new User();
			user.setD_id(regDocter.getDocterLastId());
			user.setUser_type(2);
			user.setEmail(docter.getD_email());
			user.setUser_img_path(docter.getImg_path());
			regDocter.putDocterUSerData(user);

			Email email = new Email();
			EmailService emailService = new EmailService();
			email.setEmail(docter.getD_email());
			UserService us = new UserService();
			email.setBody("Sucessfully Registered !!! \n Please Create Your Login Account\n"
					+ "http://localhost:9090/RCB_MRS//sendUserId?id=" + us.getLastUserId());
			email.setSubject("RCB MRS New Request For Creating a User Accout");
			emailService.SendingEmail(email);

			if (result) {

				response.sendRedirect("DocterAdd.jsp");
			}

		} else if (action.equals("list")) {
			response.sendRedirect("DocterList.jsp");
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
}
