package com.nshdev.persistance;

import com.nshdev.domain.UserVO;

public interface UserMapper {

	//회원 가입
	public void userRegister(UserVO user);
	
	//아이디 중복 검사
	public int idCheck(String userId);
	
	//로그인
	public UserVO userLogin(UserVO user);
}
