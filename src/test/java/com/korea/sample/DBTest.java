package com.korea.sample;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBTest {

//	static {
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		} catch (Exception e) {
//
//		}
//
//	}
//
//	@Test
//	public void testConnection() {
//		try {
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/korea", "root", "1234");
//			log.info(con);
//			log.info("연결성공");
//		} catch (Exception e) {
//			log.info("연결실패");
//		} finally {
//			
//		}
//
//	}
	
	@Setter(onMethod_ = @Autowired)
	private DataSource datasource;
	
	@Test
	public void testConnection() {
		try {
			Connection con = datasource.getConnection();
			log.info(con);
			log.info("연결성공");
		} catch (Exception e) {
			log.info("연결실패");
		}
	}

}
