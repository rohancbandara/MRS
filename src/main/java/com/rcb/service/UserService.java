package com.rcb.service;

import java.sql.ResultSet;

import org.apache.log4j.Logger;

import com.rcb.dbconnection.DbConnection;
import com.rcb.model.User;

public class UserService {
	private static final Logger LOG = Logger.getLogger(UserService.class);
	DbConnection db = new DbConnection();

	// Get Last User Id
	public int getLastUserId() {
		String sql = "SELECT user_id FROM tbl_user";
		try {
			ResultSet rs = db.getData(sql);
			while (rs.last()) {
				int lastId = rs.getInt("user_id");
				return lastId;

			}
		} catch (Exception e) {
			LOG.warn("Exception in getLastUserId()  -> UserService :", e);
		}

		return 0;
	}

	// Update User Details
	public boolean UpdateUser(User user) {
		try {
			String updateSql = "UPDATE tbl_user set user_password='" + user.getUser_password() + "',user_name='"
					+ user.getUser_name() + "' WHERE user_id='" + user.getUser_id() + "'";
			db.putData(updateSql);

			LOG.info("Sucessfully Updated User Details ! ");
			return true;
		} catch (Exception e) {
			LOG.warn("Exception in addUser(User user )  -> UserService :", e);
		}
		return false;
	}

	// get imgpath by user name
	public String getimgPathById(User user) {
		String sql = "SELECT user_img_path FROM tbl_user WHERE user_name='" + user.getUser_name() + "'";
		try {
			ResultSet rs = db.getData(sql);
			while (rs.last()) {
				String path = rs.getString("user_img_path");
				return path;

			}
		} catch (Exception e) {
			LOG.warn("Exception in getimgPathById(User user)  -> UserService :", e);
		}

		return null;
	}

	// get updatre imgpath by
	public boolean updatePathByPidOrDid(User user) {
		String sql = "UPDATE tbl_user set user_img_path='" + user.getUser_img_path() + "' WHERE p_id='" + user.getP_id()
				+ "' OR d_id='" + user.getD_id() + "'";
		try {
			db.putData(sql);

			return true;

		} catch (Exception e) {
			LOG.warn("Exception in updatePathByPidOrDid(User user)  -> UserService :", e);
		}

		return false;
	}

	public static void main(String args[]) {
		UserService dc = new UserService();
		System.out.println(dc.getLastUserId());
	}
}
