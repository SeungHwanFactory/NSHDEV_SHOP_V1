package com.nshdev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nshdev.domain.UserVO;
import com.nshdev.persistance.UserMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	UserMapper userMapper;
	
	@Autowired
	UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	//회원가입_구현체
	@Override
	public void userRegister(UserVO user) throws Exception {
		
		log.warn("비즈니스 로직 실행 - 회원가입 요청");
		userMapper.userRegister(user);
		
	}

	@Override
	public int idCheck(String userId) throws Exception {
		
		log.warn("비즈니스 로직 실행 - 아이디 중복검사 요청");
		return userMapper.idCheck(userId);
	}

	@Override
	public UserVO userLogin(UserVO user) throws Exception {
		
		log.warn("비즈니스 로직 실행 - 로그인 시도");
		
		return userMapper.userLogin(user);
	}

}
