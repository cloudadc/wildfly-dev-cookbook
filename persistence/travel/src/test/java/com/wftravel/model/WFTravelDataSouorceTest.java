package com.wftravel.model;

import java.util.Set;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;


@RunWith(Arquillian.class)
public class WFTravelDataSouorceTest {
	
	@Deployment
    public static Archive<?> createTestArchive() {
        return ShrinkWrap.create(WebArchive.class, "test.war")
        				 .addPackages(true, "com.wftravel.model")
        				 .addAsResource("META-INF/persistence.xml", "META-INF/persistence.xml")
        				 .addAsWebInfResource(EmptyAsset.INSTANCE, "beans.xml")
        				 .addAsWebInfResource("test-ds.xml", "test-ds.xml");
    }
	
	@Inject
    private EntityManager em;
	
	@Test
    public void testUser() {
		System.out.println(em);
	}

  
}
