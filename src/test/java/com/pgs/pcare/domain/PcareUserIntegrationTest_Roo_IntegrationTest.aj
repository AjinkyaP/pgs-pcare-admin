// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pgs.pcare.domain;

import com.pgs.pcare.domain.PcareUser;
import com.pgs.pcare.domain.PcareUserDataOnDemand;
import com.pgs.pcare.domain.PcareUserIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PcareUserIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PcareUserIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PcareUserIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PcareUserIntegrationTest: @Transactional;
    
    @Autowired
    PcareUserDataOnDemand PcareUserIntegrationTest.dod;
    
    @Test
    public void PcareUserIntegrationTest.testCountPcareUsers() {
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", dod.getRandomPcareUser());
        long count = PcareUser.countPcareUsers();
        Assert.assertTrue("Counter for 'PcareUser' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PcareUserIntegrationTest.testFindPcareUser() {
        PcareUser obj = dod.getRandomPcareUser();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to provide an identifier", id);
        obj = PcareUser.findPcareUser(id);
        Assert.assertNotNull("Find method for 'PcareUser' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PcareUser' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PcareUserIntegrationTest.testFindAllPcareUsers() {
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", dod.getRandomPcareUser());
        long count = PcareUser.countPcareUsers();
        Assert.assertTrue("Too expensive to perform a find all test for 'PcareUser', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PcareUser> result = PcareUser.findAllPcareUsers();
        Assert.assertNotNull("Find all method for 'PcareUser' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PcareUser' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PcareUserIntegrationTest.testFindPcareUserEntries() {
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", dod.getRandomPcareUser());
        long count = PcareUser.countPcareUsers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PcareUser> result = PcareUser.findPcareUserEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PcareUser' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PcareUser' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PcareUserIntegrationTest.testFlush() {
        PcareUser obj = dod.getRandomPcareUser();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to provide an identifier", id);
        obj = PcareUser.findPcareUser(id);
        Assert.assertNotNull("Find method for 'PcareUser' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPcareUser(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'PcareUser' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PcareUserIntegrationTest.testMergeUpdate() {
        PcareUser obj = dod.getRandomPcareUser();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to provide an identifier", id);
        obj = PcareUser.findPcareUser(id);
        boolean modified =  dod.modifyPcareUser(obj);
        Integer currentVersion = obj.getVersion();
        PcareUser merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'PcareUser' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PcareUserIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", dod.getRandomPcareUser());
        PcareUser obj = dod.getNewTransientPcareUser(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PcareUser' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'PcareUser' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PcareUserIntegrationTest.testRemove() {
        PcareUser obj = dod.getRandomPcareUser();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PcareUser' failed to provide an identifier", id);
        obj = PcareUser.findPcareUser(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PcareUser' with identifier '" + id + "'", PcareUser.findPcareUser(id));
    }
    
}
