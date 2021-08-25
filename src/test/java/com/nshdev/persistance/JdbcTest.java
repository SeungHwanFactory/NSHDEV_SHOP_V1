package com.nshdev.persistance;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JdbcTest {
	/**
	 * 클래스가 로딩된다.
	 * 클래스 변수가 있으면 메모리를 생성한다.
	 * static 블록이 선언된 순서대로 실행된다.
	 */
	static {
		/* 클래스 초기화 블럭 */
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace(); //사용 의미 공부하기!
		}
	}

	@Test
	public void 커넥션연결테스트() {
		try(Connection con = 
				DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE",
						"nshdev",
						"1234")) {
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
}
