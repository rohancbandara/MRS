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
import com.rcb.service.DocterService;

/**
 * Servlet implementation class DocterUpdateServlet
 */
@WebServlet("/docterUpdate")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class DocterUpdateServlet extends HttpServlet {
	private static final String SAVE_DIR = "IMG";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Docter docter = new Docter();
		String savePath = "D:/tecnosoft_JAVA_EE/workshop//RCB_MRS/src/main/webapp/static/" + SAVE_DIR + "/";
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		Part part = request.getPart("file");
		String fileName = extractFileName(part);

		part.write(savePath + fileName);

		String filePath = savePath + fileName;
		docter.setD_id(Integer.parseInt(request.getParameter("txtd_id")));
		docter.setD_FName(request.getParameter("txtFname"));
		docter.setD_LName(request.getParameter("txtLname"));
		docter.setTel(request.getParameter("number"));
		docter.setD_dob(request.getParameter("dob"));
		docter.setImg_path("static/" + SAVE_DIR + "/" + fileName);

		DocterService dc = new DocterService();
		Boolean result = dc.updateDocterDetails(docter);
		if (result) {
			response.sendRedirect("DocterList.jsp");
		}
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

			response.sendRedirect("DocterList.jsp");

		}

	}

}
