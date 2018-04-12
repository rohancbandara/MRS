package com.rcb.service;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.rcb.dbconnection.DbConnection;
import com.rcb.model.Patient;
import com.rcb.model.Special;
import com.rcb.model.User;

public class PatientService {
	private static final Logger LOG = Logger.getLogger(PatientService.class);
	DbConnection db = new DbConnection();

	public ArrayList<Patient> allPatient() {
		ArrayList<Patient> patients = new ArrayList<Patient>();
		try {
			String sql = "SELECT tbl_patient.p_id, tbl_patient.p_fname, tbl_patient.p_lname, tbl_patient.p_nic, tbl_patient.p_email, tbl_patient.p_gender, tbl_patient.p_dob, tbl_patient.p_blood_group, tbl_patient.p_marital, tbl_patient.p_haddress, tbl_patient.p_tel, tbl_patient.p_status, tbl_patient.is_delete, tbl_patient.create_date,tbl_patient.img_path FROM tbl_patient ";
			ResultSet rs = db.getData(sql);
			while (rs.next()) {
				Patient patient = new Patient();
				patient.setP_id(rs.getInt("tbl_patient.p_id"));
				patient.setP_fname(rs.getString("tbl_patient.p_fname"));
				patient.setP_lname(rs.getString("tbl_patient.p_lname"));
				patient.setP_nic(rs.getString("tbl_patient.p_nic"));
				patient.setP_email(rs.getString("tbl_patient.p_email"));
				patient.setP_gender(rs.getString("tbl_patient.p_gender"));
				patient.setP_dob(rs.getString("tbl_patient.p_dob"));
				patient.setP_blood(rs.getString("tbl_patient.p_blood_group"));
				patient.setP_marital(rs.getString("tbl_patient.p_marital"));
				patient.setP_haddress(rs.getString("tbl_patient.p_haddress"));
				patient.setP_tel(rs.getString("tbl_patient.p_tel"));
				patient.setP_status(rs.getString("tbl_patient.p_status"));
				patient.setId_delete(rs.getInt("tbl_patient.is_delete"));
				patient.setP_cDate(rs.getString("tbl_patient.create_date"));
				patient.setImg_path(rs.getString("tbl_patient.img_path"));
				patients.add(patient);
				LOG.info("Sucessfully Loaded  Docter " + patient.getP_id() + " " + patient.getP_fname() + "  "
						+ patient.getP_lname() + "!");
			}
			LOG.info("Sucessfully Completed Load All Patients ! ");

		} catch (Exception e) {
			LOG.warn("Exception in getAllDocters()  -> DocterService :", e);

		}
		return (patients);
	}

	// Insert Patient-------------
	public boolean putPatientData(Patient patient) {

		try {

			String patientPutSql = "INSERT INTO tbl_patient(p_fname,\r\n" + "p_lname,\r\n" + "p_nic,\r\n"
					+ "p_email,\r\n" + "p_gender,\r\n" + "p_dob,\r\n" + "p_blood_group,\r\n" + "p_marital,\r\n"
					+ "p_haddress,\r\n" + "p_tel,\r\n" + "p_status,\r\n" + "img_path,\r\n" + "type_id)VALUES(" + "'"
					+ patient.getP_fname() + "'," + "'" + patient.getP_lname() + "'," + "'" + patient.getP_nic() + "',"
					+ "'" + patient.getP_email() + "'," + "'" + patient.getP_gender() + "'," + "'" + patient.getP_dob()
					+ "'," + "'" + patient.getP_blood() + "'," + "'" + patient.getP_marital() + "'," + "'"
					+ patient.getP_haddress() + "'," + "'" + patient.getP_tel() + "'," + "'" + patient.getP_status()
					+ "'," + "'" + patient.getImg_path() + "'," + "'" + patient.getType_id() + "')";
			db.putData(patientPutSql);

			LOG.info("Sucessfully Added Patient ! ");
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			LOG.warn("Exception in  putPatientData(Patient patient)  -> PatientService :", e);

		}
		return false;
	}

	// Delete patient
	public boolean deletePatient(int pid) {
		try {
			String deletePatientSql = "DELETE FROM tbl_patient WHERE p_id='" + pid + "'";
			db.putData(deletePatientSql);
			LOG.info("Sucessfully Deleted Patient ! " + pid);
			return true;
		} catch (Exception e) {
			LOG.warn("Exception in  deletePatient(int pid)  -> PatientService :", e);
			e.printStackTrace();
		}
		return false;
	}

	// update patient
	public boolean updatePatient(Patient patient) {
		try {
			String updatePatientSql = "UPDATE tbl_patient set p_fname='" + patient.getP_fname() + "',\r\n" + "p_lname='"
					+ patient.getP_lname() + "',\r\n" + "p_nic='" + patient.getP_nic() + "',\r\n" + "p_email='"
					+ patient.getP_email() + "',\r\n" + "p_gender='" + patient.getP_gender() + "',\r\n" + "p_dob='"
					+ patient.getP_dob() + "',\r\n" + "p_blood_group='" + patient.getP_blood() + "',\r\n"
					+ "p_marital='" + patient.getP_marital() + "',\r\n" + "p_haddress='" + patient.getP_haddress()
					+ "',\r\n" + "p_tel='" + patient.getP_tel() + "',\r\n" + "p_status='" + patient.getP_status()
					+ "',img_path='" + patient.getImg_path() + "' WHERE p_id='" + patient.getP_id() + "'";

			db.putData(updatePatientSql);
			LOG.info("Sucessfully Updated Patient ! " + patient.getP_id());
			return true;
		} catch (Exception e) {
			LOG.warn("Exception in  updatePatient(Patient patient))  -> PatientService :", e);
			e.printStackTrace();
		}
		return false;
	}

	// insert Useer details
	public boolean putPatientUSerData(User user) {
		Special special = new Special();
		try {
			String insertDocterUserSQL = "INSERT INTO tbl_user(user_email,p_id,type_id,user_img_path)VALUES('"
					+ user.getEmail() + "','" + user.getP_id() + "','" + user.getUser_type() + "','"
					+ user.getUser_img_path() + "')";

			db.putData(insertDocterUserSQL);

			LOG.info("Sucessfully Added User Details Patient ! ");
			return true;

		} catch (Exception e) {
			LOG.warn("Exception in  putPatientUSerData()  -> PatientService :", e);
		}
		return false;
	}

	public int getPatientLastId() {
		String sql = "SELECT p_id FROM tbl_patient";
		try {
			ResultSet rs = db.getData(sql);
			while (rs.last()) {
				int lastId = rs.getInt("p_id");
				return lastId;

			}
		} catch (Exception e) {
			LOG.warn("Exception in getPatientLastId()  -> PatientService :", e);
		}

		return 0;
	}

	// Delete patient user Details
	public boolean deletePatientUser(int pid) {
		try {
			String deletePatientSql = "DELETE FROM tbl_user WHERE p_id='" + pid + "'";
			db.putData(deletePatientSql);
			LOG.info("Sucessfully Deleted Detail of Patient ! " + pid);
			return true;
		} catch (Exception e) {
			LOG.warn("Exception in  deletePatientUser(int pid)  -> PatientService :", e);
			e.printStackTrace();
		}
		return false;
	}

	// public static void main(String args[]) {
	// PatientService ps = new PatientService();
	// User user = new User();
	// user.setP_id(ps.getPatientLastId());
	//
	// System.out.println(ps.getPatientLastId());
	// ps.putPatientUSerData(user);
	// }

}
