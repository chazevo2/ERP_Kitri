package com.project.erp.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {
		private  String id;
		private  String pwd;
		private  String name;
		private  String hp;
		private  String email;
		private  String address;
		private  String picture;
		private int departmentCode;
		private  String gradeCode;
		private Date hiredate;
		private Date firedate;
		private String confirm ;
		private MultipartFile file;
		
		public Member() {
			
		}
		public Member(String id, String pwd, String name, String hp, String email, String address, String picture,
				int departmentCode, String gradeCode, Date hiredate, Date firedate, String confirm,
				MultipartFile file) {
			this.id = id;
			this.pwd = pwd;
			this.name = name;
			this.hp = hp;
			this.email = email;
			this.address = address;
			this.picture = picture;
			this.departmentCode = departmentCode;
			this.gradeCode = gradeCode;
			this.hiredate = hiredate;
			this.firedate = firedate;
			this.confirm = confirm;
			this.file = file;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPwd() {
			return pwd;
		}
		public void setPwd(String pwd) {
			this.pwd = pwd;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getHp() {
			return hp;
		}
		public void setHp(String hp) {
			this.hp = hp;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPicture() {
			return picture;
		}
		public void setPicture(String picture) {
			this.picture = picture;
		}
		public int getDepartmentCode() {
			return departmentCode;
		}
		public void setDepartmentCode(int departmentCode) {
			this.departmentCode = departmentCode;
		}
		public String getGradeCode() {
			return gradeCode;
		}
		public void setGradeCode(String gradeCode) {
			this.gradeCode = gradeCode;
		}
		public Date getHiredate() {
			return hiredate;
		}
		public void setHiredate(Date hiredate) {
			this.hiredate = hiredate;
		}
		public Date getFiredate() {
			return firedate;
		}
		public void setFiredate(Date firedate) {
			this.firedate = firedate;
		}
		public String getConfirm() {
			return confirm;
		}
		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
		}
		@Override
		public String toString() {
			return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", hp=" + hp + ", email=" + email
					+ ", address=" + address + ", picture=" + picture + ", departmentCode=" + departmentCode
					+ ", gradeCode=" + gradeCode + ", hiredate=" + hiredate + ", firedate=" + firedate + ", confirm="
					+ confirm + ", file=" + file + "]";
		}
}
