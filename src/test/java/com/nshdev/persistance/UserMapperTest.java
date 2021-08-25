package com.nshdev.persistance;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nshdev.domain.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	
	@Autowired
	private UserMapper userMapper;
	
	//회원가입 테스트
	//@Test
	public void 회원가입테스트() throws Exception {
		//UserVO 객체 생성
		UserVO user = new UserVO();
		
		user.setUserId("legacy-test");
		user.setUserPw("1234");
		user.setUserName("legacy-test");
		user.setUserMail("legacy-test");
		user.setUserAddr1("legacy-test");
		user.setUserAddr2("legacy-test");
		user.setUserAddr3("legacy-test");
		
		
		userMapper.userRegister(user);
	}
	
	//@Test
	public void 아이디중복검사테스트() throws Exception {
		String id = "admin23"; //존재하는 아이디
		String id2 = "아아아아"; //존재하지 않는 아이디
		
		userMapper.idCheck(id);
		userMapper.idCheck(id2);
	}
	
	@Test
	public void 로그인테스트() throws Exception {
		UserVO user = new UserVO();
		
		//맞는 아이디, 비밀번호 입력한 경우
		user.setUserId("test");
		user.setUserPw("test");
		
		//맞지 않는 아이디, 비밀번호 입력한 경우
//		user.setUserId("test");
//		user.setUserPw("1234");
		
		
	}

}
