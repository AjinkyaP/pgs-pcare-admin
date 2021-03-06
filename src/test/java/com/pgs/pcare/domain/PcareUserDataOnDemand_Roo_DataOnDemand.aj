// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pgs.pcare.domain;

import com.pgs.pcare.domain.BuddyDataOnDemand;
import com.pgs.pcare.domain.PcareUser;
import com.pgs.pcare.domain.PcareUserDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PcareUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PcareUserDataOnDemand: @Component;
    
    private Random PcareUserDataOnDemand.rnd = new SecureRandom();
    
    private List<PcareUser> PcareUserDataOnDemand.data;
    
    @Autowired
    BuddyDataOnDemand PcareUserDataOnDemand.buddyDataOnDemand;
    
    public PcareUser PcareUserDataOnDemand.getNewTransientPcareUser(int index) {
        PcareUser obj = new PcareUser();
        setActive(obj, index);
        setCreatedOn(obj, index);
        setDateOfBirth(obj, index);
        setDeviceSerialNumber(obj, index);
        setEmailId(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setPhoneNumber(obj, index);
        setRegisteredOn(obj, index);
        setTermsAcceptedOn(obj, index);
        setUserID(obj, index);
        return obj;
    }
    
    public void PcareUserDataOnDemand.setActive(PcareUser obj, int index) {
        Boolean active = Boolean.TRUE;
        obj.setActive(active);
    }
    
    public void PcareUserDataOnDemand.setCreatedOn(PcareUser obj, int index) {
        Date createdOn = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedOn(createdOn);
    }
    
    public void PcareUserDataOnDemand.setDateOfBirth(PcareUser obj, int index) {
        Date dateOfBirth = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfBirth(dateOfBirth);
    }
    
    public void PcareUserDataOnDemand.setDeviceSerialNumber(PcareUser obj, int index) {
        String deviceSerialNumber = "deviceSerialNumber_" + index;
        obj.setDeviceSerialNumber(deviceSerialNumber);
    }
    
    public void PcareUserDataOnDemand.setEmailId(PcareUser obj, int index) {
        String emailId = "foo" + index + "@bar.com";
        obj.setEmailId(emailId);
    }
    
    public void PcareUserDataOnDemand.setFirstName(PcareUser obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void PcareUserDataOnDemand.setLastName(PcareUser obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void PcareUserDataOnDemand.setPhoneNumber(PcareUser obj, int index) {
        String phoneNumber = "phoneNumber_" + index;
        obj.setPhoneNumber(phoneNumber);
    }
    
    public void PcareUserDataOnDemand.setRegisteredOn(PcareUser obj, int index) {
        Date registeredOn = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRegisteredOn(registeredOn);
    }
    
    public void PcareUserDataOnDemand.setTermsAcceptedOn(PcareUser obj, int index) {
        Date termsAcceptedOn = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setTermsAcceptedOn(termsAcceptedOn);
    }
    
    public void PcareUserDataOnDemand.setUserID(PcareUser obj, int index) {
        Integer userID = new Integer(index);
        obj.setUserID(userID);
    }
    
    public PcareUser PcareUserDataOnDemand.getSpecificPcareUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PcareUser obj = data.get(index);
        Long id = obj.getId();
        return PcareUser.findPcareUser(id);
    }
    
    public PcareUser PcareUserDataOnDemand.getRandomPcareUser() {
        init();
        PcareUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return PcareUser.findPcareUser(id);
    }
    
    public boolean PcareUserDataOnDemand.modifyPcareUser(PcareUser obj) {
        return false;
    }
    
    public void PcareUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = PcareUser.findPcareUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PcareUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PcareUser>();
        for (int i = 0; i < 10; i++) {
            PcareUser obj = getNewTransientPcareUser(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
