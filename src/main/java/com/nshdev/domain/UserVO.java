package com.nshdev.domain;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class UserVO {
	/**
	 * userId: 아이디
	 * userPw: 비밀번호
	 * userName: 이름
	 * userMail: 이메일
	 * userAddr1: 우편번호
	 * userAddr2: 회원 주소
	 * userAddr3: 회원 상세주소
	 * adminCf: 일반사용자 / 관리자 구분 (0 : 일반 , 1: 관리자)
	 * regDate: 등록일자
	 * cash: 잔고
	 * point: 포인트
	 */
	private String userId;
	private String userPw;
	private String userName;
	private String userMail;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private int adminCf;
	private int regDate;
	private int cash;
	private int point;
	
	
}
