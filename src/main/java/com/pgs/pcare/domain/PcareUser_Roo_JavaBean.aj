// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pgs.pcare.domain;

import com.pgs.pcare.domain.Buddy;
import com.pgs.pcare.domain.PcareUser;
import java.util.Date;

privileged aspect PcareUser_Roo_JavaBean {
    
    public Integer PcareUser.getUserID() {
        return this.userID;
    }
    
    public void PcareUser.setUserID(Integer userID) {
        this.userID = userID;
    }
    
    public String PcareUser.getFirstName() {
        return this.firstName;
    }
    
    public void PcareUser.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String PcareUser.getLastName() {
        return this.lastName;
    }
    
    public void PcareUser.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String PcareUser.getEmailId() {
        return this.emailId;
    }
    
    public void PcareUser.setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public Date PcareUser.getDateOfBirth() {
        return this.dateOfBirth;
    }
    
    public void PcareUser.setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String PcareUser.getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void PcareUser.setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public Buddy PcareUser.getBuddy() {
        return this.buddy;
    }
    
    public void PcareUser.setBuddy(Buddy buddy) {
        this.buddy = buddy;
    }
    
    public String PcareUser.getDeviceSerialNumber() {
        return this.deviceSerialNumber;
    }
    
    public void PcareUser.setDeviceSerialNumber(String deviceSerialNumber) {
        this.deviceSerialNumber = deviceSerialNumber;
    }
    
    public Date PcareUser.getCreatedOn() {
        return this.createdOn;
    }
    
    public void PcareUser.setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }
    
    public Date PcareUser.getRegisteredOn() {
        return this.registeredOn;
    }
    
    public void PcareUser.setRegisteredOn(Date registeredOn) {
        this.registeredOn = registeredOn;
    }
    
    public Date PcareUser.getTermsAcceptedOn() {
        return this.termsAcceptedOn;
    }
    
    public void PcareUser.setTermsAcceptedOn(Date termsAcceptedOn) {
        this.termsAcceptedOn = termsAcceptedOn;
    }
    
    public Boolean PcareUser.getActive() {
        return this.active;
    }
    
    public void PcareUser.setActive(Boolean active) {
        this.active = active;
    }
    
}
