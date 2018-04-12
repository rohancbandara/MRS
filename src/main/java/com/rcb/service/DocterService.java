package com.rcb.service;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.rcb.dbconnection.DbConnection;
import com.rcb.model.Docter;
import com.rcb.model.Special;
import com.rcb.model.User;

public class DocterService {
	private static final Logger LOG = Logger.getLogger(DocterService.class);
	DbConnection db = new DbConnection();

	// insert Docter details
	public boolean putDocterData(Docter docter) {
		Special special = new Special();
		try {
			String insertDocterSQL = "INSERT INTO tbl_docters(tbl_docters.d_fname,\r\n" + "tbl_docters.d_lname,\r\n"
					+ "tbl_docters.d_dob,\r\n" + "tbl_docters.d_email,\r\n" + "tbl_docters.d_special,\r\n "
					+ "tbl_docters.img_path,\r\n" + "tbl_docters.type_id,\r\n" + "tbl_docters.is_delete)VALUES(" + "'"
					+ docter.getD_FName() + "'," + "'" + docter.getD_LName() + "'," + "'" + docter.getD_dob() + "',"
					+ "'" + docter.getD_email() + "'," + "'" + docter.getD_special() + "','" + docter.getImg_path()
					+ "','" + docter.getType() + "'," + "'" + docter.getIs_delete() + "') ";

			db.putData(insertDocterSQL);

			LOG.info("Sucessfully Added Docter ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in  putDocterData(Docter docter)  -> DocterService :", e);
		}
		return false;
	}

	// Update Docter details
	public boolean updateDocterDetails(Docter docter) {
		Special special = new Special();
		try {
			String updateSQL = "UPDATE tbl_docters set d_fname='" + docter.getD_FName() + "', d_lname='"
					+ docter.getD_LName() + "',d_dob='" + docter.getD_dob() + "',d_tel='" + docter.getTel()
					+ "' WHERE d_id='" + docter.getD_id() + "' ";
			db.putData(updateSQL);

			LOG.info("Sucessfully Updated Docter ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in  updateDocterDetails(Docter docter)  -> DocterService :", e);
		}
		return false;
	}

	public int getSpecialId(Special special) {
		String getSpecialSQL = "SELECT sp_id FROM tbl_special WHERE sp_name='" + special.getSp_name() + "' ";
		int sp_idDb = 0;
		try {
			ResultSet rs = db.getData(getSpecialSQL);
			while (rs.next()) {
				sp_idDb = rs.getInt("sp_id");

			}
			LOG.info("Sucessfully Loaded  Docter " + special + " ! ");

		} catch (Exception e) {
			LOG.warn("Exception in getSpecialId(Special special)  -> DocterService :", e);
		}
		return sp_idDb;

	}

	// delete docter
	public boolean deleteDocter(int did) {
		try {
			String deleteDocterSql = "DELETE FROM tbl_docters WHERE d_id='" + did + "'";
			db.putData(deleteDocterSql);
			LOG.info("Sucessfully Delete  Docter " + did + " ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in deleteDocter(int did)  -> DocterService :", e);
		}
		return false;
	}

	// ------get all doctor------------
	public ArrayList<Docter> getAllDocters() {
		ArrayList<Docter> docters = new ArrayList<Docter>();

		try {
			String sql = "SELECT tbl_docters.d_id,tbl_docters.img_path, tbl_docters.d_fname, tbl_docters.d_lname, tbl_docters.d_dob, tbl_docters.d_email, tbl_docters.d_special, tbl_docters.create_date,tbl_docters.edit_date, tbl_special.sp_name FROM tbl_docters Inner Join tbl_special ON tbl_special.sp_id = tbl_docters.d_special ";

			ResultSet rs = db.getData(sql);
			while (rs.next()) {
				Docter docter = new Docter();

				docter.setD_id(rs.getInt("tbl_docters.d_id"));
				docter.setD_FName(rs.getString("tbl_docters.d_fname"));
				docter.setD_LName(rs.getString("tbl_docters.d_lname"));
				docter.setD_dob(rs.getString("tbl_docters.d_dob"));
				docter.setD_email(rs.getString("tbl_docters.d_email"));
				docter.setD_special(rs.getInt("tbl_docters.d_special"));
				docter.setCreate_date(rs.getString("tbl_docters.create_date"));
				docter.setEdit_date(rs.getString("tbl_docters.edit_date"));
				docter.setD_specileName(rs.getString("tbl_special.sp_name"));
				docter.setImg_path(rs.getString("tbl_docters.img_path"));
				docters.add(docter);
				LOG.info("Sucessfully Loaded  Docter " + docter.getD_FName() + " " + docter.getD_LName() + "!" + " "
						+ docter.getImg_path());
			}
			rs.close();
			LOG.info("Sucessfully Completed Load All Docters ! ");

		} catch (Exception e) {
			LOG.warn("Exception in getAllDocters()  -> DocterService :", e);

		}

		return (docters);
	}

	// -------get selected doctoers details---------
	public ArrayList<Docter> getSelectDocterById(String id) {
		ArrayList<Docter> docters = new ArrayList<Docter>();

		try {
			int intId = Integer.parseInt(id);
			String sql = "SELECT tbl_special.sp_name,tbl_docters.create_date,tbl_docters.d_tel,tbl_docters.edit_date, tbl_docters.d_fname,tbl_docters.d_special, tbl_docters.d_lname, tbl_docters.d_id, tbl_docters.d_dob, tbl_docters.d_email, tbl_docters.img_path FROM tbl_docters Inner Join tbl_special ON tbl_docters.d_special = tbl_special.sp_id WHERE tbl_docters.d_id='"
					+ id + "'";

			ResultSet rs = db.getData(sql);
			while (rs.next()) {
				Docter docter = new Docter();

				docter.setD_id(rs.getInt("tbl_docters.d_id"));
				docter.setD_FName(rs.getString("tbl_docters.d_fname"));
				docter.setD_LName(rs.getString("tbl_docters.d_lname"));
				docter.setD_dob(rs.getString("tbl_docters.d_dob"));
				docter.setD_email(rs.getString("tbl_docters.d_email"));
				docter.setD_special(rs.getInt("tbl_docters.d_special"));
				docter.setCreate_date(rs.getString("tbl_docters.create_date"));
				docter.setEdit_date(rs.getString("tbl_docters.edit_date"));
				docter.setD_specileName(rs.getString("tbl_special.sp_name"));
				docter.setImg_path(rs.getString("tbl_docters.img_path"));
				docter.setTel(rs.getString("tbl_docters.d_tel"));
				docters.add(docter);
				LOG.info("Sucessfully Loaded  Docter " + docter.getD_FName() + " " + docter.getD_LName() + "!" + " "
						+ docter.getImg_path());
			}
			rs.close();
			LOG.info("Sucessfully Completed Load selected Doctor ! ");

		} catch (Exception e) {
			LOG.warn("Exception in getSelectDocterById(int id)  -> DocterService :", e);

		}

		return (docters);
	}

	// insert Useer details
	public boolean putDocterUSerData(User user) {
		Special special = new Special();
		try {
			String insertDocterUserSQL = "INSERT INTO tbl_user(d_id,type_id,user_email,user_img_path)VALUES('"
					+ user.getD_id() + "','" + user.getUser_type() + "','" + user.getEmail() + "','"
					+ user.getUser_img_path() + "')";

			db.putData(insertDocterUserSQL);

			LOG.info("Sucessfully Added User Details Docter ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in  putDocterUSerData()  -> DocterService :", e);
		}
		return false;
	}

	public int getDocterLastId() {
		String sql = "SELECT d_id FROM tbl_docters";
		try {
			ResultSet rs = db.getData(sql);
			while (rs.last()) {
				int lastId = rs.getInt("d_id");
				return lastId;

			}
		} catch (Exception e) {
			LOG.warn("Exception in getDocterLastId()  -> DocterService :", e);
		}

		return 0;
	}

	// delete docter user details
	public boolean deleteDocterUser(int did) {
		try {
			String deleteDocterSql = "DELETE FROM tbl_user WHERE d_id='" + did + "'";
			db.putData(deleteDocterSql);
			LOG.info("Sucessfully Delete User Details of  Docter " + did + " ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in deleteDocterUser(int did)  -> DocterService :", e);
		}
		return false;
	}

	public static void main(String args[]) {
		DocterService dc = new DocterService();
		Docter docter = new Docter();
		docter.setD_id(85);
		ArrayList<Docter> doctersList = dc.getSelectDocterById("86");
		for (int i = 0; i < doctersList.size(); i++) {

			System.out.println(doctersList.get(i).getD_FName());

		}
	}

}
