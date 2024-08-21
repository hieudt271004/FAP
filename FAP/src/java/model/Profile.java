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
public class Profile {
    private int profileID, sid;
    private String fullName, idCard, address, phoneNumber, email, issuePlace;
    private Date dob, issueDate;
    private boolean gender;

    public Profile() {
    }

    public Profile(String fullName, String idCard, String address, String phoneNumber, String email, String issuePlace, Date dob, Date issueDate) {
        this.fullName = fullName;
        this.idCard = idCard;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.issuePlace = issuePlace;
        this.dob = dob;
        this.issueDate = issueDate;
    }

    public Profile(int sid, String fullName, String idCard, String address, String phoneNumber, String email, String issuePlace, Date dob, Date issueDate) {
        this.sid = sid;
        this.fullName = fullName;
        this.idCard = idCard;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.issuePlace = issuePlace;
        this.dob = dob;
        this.issueDate = issueDate;
    }

    
    public Profile(int profileID, String fullName, String idCard, String address, String phoneNumber, String email, String issuePlace, Date dob, Date issueDate, boolean genger) {
        this.profileID = profileID;
        this.fullName = fullName;
        this.idCard = idCard;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.issuePlace = issuePlace;
        this.dob = dob;
        this.issueDate = issueDate;
        this.gender = genger;
    }

    public int getProfileID() {
        return profileID;
    }

    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIssuePlace() {
        return issuePlace;
    }

    public void setIssuePlace(String issuePlace) {
        this.issuePlace = issuePlace;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public boolean isGenger() {
        return gender;
    }

    public void setGenger(boolean genger) {
        this.gender = genger;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }
    
    
}
