package com.nshdev.persistance;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DSTest {

	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	//@Test
	public void 데이터소스커넥션테스트() {
		try (Connection con = ds.getConnection();){
			System.out.println("con = " + con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void sqlSessionFactoryTest() {
		try (
				Connection con = ds.getConnection();
				SqlSession session = sqlSessionFactory.openSession();
			){
			log.warn("con = " + con);
			log.warn("session(세션) = " + session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
