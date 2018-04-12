package com.rcb.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

import com.rcb.model.Email;

//String from = "rcb.medical.record.system@gmail.com"; // Your mail id
//String pass = "rcb@1234"; // Your Password

public class EmailService {
	private static final Logger LOG = Logger.getLogger(EmailService.class);

	public boolean SendingEmail(Email email) {

		final String username = "rcb.medical.record.system@gmail.com";
		final String password = "rcb@1234";

		Properties props = new Properties();

		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("rcb.medical.record.system@gmail.com"));// ur email
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getEmail()));// u will send
																										// to
			message.setSubject(email.getSubject());
			message.setText(email.getBody());
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			Multipart multipart = new MimeMultipart();

			LOG.info("sending......");
			Transport.send(message);
			LOG.info("Sucessfully Send Message..>!!!");
			return true;

		} catch (MessagingException e) {
			LOG.warn("Exception in SendingEmail(Email email)  -> EmailService :", e);
		}
		return false;
	}

}
