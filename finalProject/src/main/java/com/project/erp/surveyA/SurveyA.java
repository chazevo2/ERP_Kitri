package com.project.erp.surveyA;

import java.sql.Date;

public class SurveyA {
	// select
	private int snum;
	private String title;
	private Date registdate;
	private Date modifydate;
	private Date startdate;
	private Date enddate;
	private int parent; // snum
	private int qnum;
	private String question;
	private String atype;
	// insert
	private int snum_multiple;
	private int qnum_multiple;
	private int rnum; // ½ÃÄö½º
	private Date responddate;
	private int mnum;
	private String mtext;
	private String shortanswer;
	private String longanswer;
	private String id; // member id

	public SurveyA() {
	}

	public SurveyA(int snum, String title, Date registdate, Date modifydate, Date startdate, Date enddate, int parent,
			int qnum, String question, String atype, int snum_multiple, int qnum_multiple, int rnum, Date responddate,
			int mnum, String mtext, String shortanswer, String longanswer, String id) {
		super();
		this.snum = snum;
		this.title = title;
		this.registdate = registdate;
		this.modifydate = modifydate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.parent = parent;
		this.qnum = qnum;
		this.question = question;
		this.atype = atype;
		this.snum_multiple = snum_multiple;
		this.qnum_multiple = qnum_multiple;
		this.rnum = rnum;
		this.responddate = responddate;
		this.mnum = mnum;
		this.mtext = mtext;
		this.shortanswer = shortanswer;
		this.longanswer = longanswer;
		this.id = id;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public int getSnum_multiple() {
		return snum_multiple;
	}

	public void setSnum_multiple(int snum_multiple) {
		this.snum_multiple = snum_multiple;
	}

	public int getQnum_multiple() {
		return qnum_multiple;
	}

	public void setQnum_multiple(int qnum_multiple) {
		this.qnum_multiple = qnum_multiple;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public Date getResponddate() {
		return responddate;
	}

	public void setResponddate(Date responddate) {
		this.responddate = responddate;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMtext() {
		return mtext;
	}

	public void setMtext(String mtext) {
		this.mtext = mtext;
	}

	public String getShortanswer() {
		return shortanswer;
	}

	public void setShortanswer(String shortanswer) {
		this.shortanswer = shortanswer;
	}

	public String getLonganswer() {
		return longanswer;
	}

	public void setLonganswer(String longanswer) {
		this.longanswer = longanswer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "SurveyA [snum=" + snum + ", title=" + title + ", registdate=" + registdate + ", modifydate="
				+ modifydate + ", startdate=" + startdate + ", enddate=" + enddate + ", parent=" + parent + ", qnum="
				+ qnum + ", question=" + question + ", atype=" + atype + ", snum_multiple=" + snum_multiple
				+ ", qnum_multiple=" + qnum_multiple + ", rnum=" + rnum + ", responddate=" + responddate + ", mnum="
				+ mnum + ", mtext=" + mtext + ", shortanswer=" + shortanswer + ", longanswer=" + longanswer + ", id="
				+ id + "]";
	}

}
