package com.rcb.model;

public class User {
	private int user_id;
	private String user_name;
	private String user_password;
	private int user_type;
	private String user_status;
	private String user_regDate;
	private int d_id;
	private int p_id;
	private String user_img_path;
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_img_path() {
		return user_img_path;
	}

	public void setUser_img_path(String user_img_path) {
		this.user_img_path = user_img_path;
	}

	public int getD_id() {
		return d_id;
	}

	public void setD_id(int d_id) {
		this.d_id = d_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getUser_regDate() {
		return user_regDate;
	}

	public void setUser_regDate(String user_regDate) {
		this.user_regDate = user_regDate;
	}

}
