package com.nshdev.service;

import com.nshdev.domain.UserVO;

public interface UserService {

	//회원가입
	public void userRegister(UserVO user) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(String userId) throws Exception;
	
	//로그인
	public UserVO userLogin(UserVO user) throws Exception;
}
