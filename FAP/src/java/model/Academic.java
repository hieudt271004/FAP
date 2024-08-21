/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ai
 */
public class Academic {
    private int academicID, sid;
    private String rollNumber, oldNumber, mode, currentTerm, major, curriculumn, capstone;
    private Date enrollDate;
    private boolean studentStatus;

    public Academic() {
    }

    public Academic(int academicID, int sid, String rollNumber, String oldNumber, String mode, String currentTerm, String major, String curriculumn, Date enrollDate, boolean studentStatus) {
        this.academicID = academicID;
        this.sid = sid;
        this.rollNumber = rollNumber;
        this.oldNumber = oldNumber;
        this.mode = mode;
        this.currentTerm = currentTerm;
        this.major = major;
        this.curriculumn = curriculumn;
        this.enrollDate = enrollDate;
        this.studentStatus = studentStatus;
    }

    public int getAcademicID() {
        return academicID;
    }

    public void setAcademicID(int academicID) {
        this.academicID = academicID;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getOldNumber() {
        return oldNumber;
    }

    public void setOldNumber(String oldNumber) {
        this.oldNumber = oldNumber;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getCurrentTerm() {
        return currentTerm;
    }

    public void setCurrentTerm(String currentTerm) {
        this.currentTerm = currentTerm;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCurriculumn() {
        return curriculumn;
    }

    public void setCurriculumn(String curriculumn) {
        this.curriculumn = curriculumn;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public boolean isStudentStatus() {
        return studentStatus;
    }

    public void setStudentStatus(boolean studentStatus) {
        this.studentStatus = studentStatus;
    }

    public String getCapstone() {
        return capstone;
    }

    public void setCapstone(String capstone) {
        this.capstone = capstone;
    }
    
    
}
