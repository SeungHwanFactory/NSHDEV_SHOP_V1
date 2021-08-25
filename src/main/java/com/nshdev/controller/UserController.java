package com.nshdev.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nshdev.domain.UserVO;
import com.nshdev.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/users")
@Log4j
public class UserController {

	@Autowired
	private UserService userService;
	
	//JavaMailSender 객체 DI
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void GETregisterPage() {
		log.warn("회원가입 페이지로 이동합니다");
		
	}
	@RequestMapping(value = "/register")
	public String POSTregisterPage(UserVO user) throws Exception {
		
		log.warn("회원가입 진행");
		
		//회원가입 비즈니스 로직 수행
		userService.userRegister(user);
		
		log.warn("회원가입 비즈니스 로직 성공");
		
		return "redirect:/main";
	}//POSTregisterPage( ) 종료
	
	//아이디 중복 검사
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String POSTuserIdCheck(String userId) throws Exception {
		//log.warn("아이디 중복검사 진행");
		int result = userService.idCheck(userId);
		
		log.warn("결과값 = " + result);
		
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	//이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String GETmailCheck(String email) throws Exception {
		
		//뷰에서 넘어온 데이터 확인
		log.warn("인증번호 : "  + email);
		
		//인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		log.warn("인증번호:  " + checkNum);
		
		//이메일 전송
		String setFrom = "noh160308@naver.com"; // root-context.xml에 삽입한 이메일 계정
		String toMail = email;//뷰에서 받은 이메일 주소
		String title = "회원가입 인증 메일입니다.";
		String content = 
				"NSHDEV SHOP에 가입에 응해주셔서 감사드립니다." +
				"<br><br>" +
				"인증번호는 " + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입해 주세요.";
		
		//메인 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//ajax는 String 타입만 가능
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	
	//로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void GETloginPage() {
		log.warn("로그인 페이지로 이동합니다.");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String PostloginPage(HttpServletRequest req, UserVO user, RedirectAttributes rttr) throws Exception { 
		log.warn("로그인 메소드 진입");
		log.warn("전달된 데이터: " + user);
		
		HttpSession session = req.getSession();
		UserVO lvo = userService.userLogin(user);
		
		log.warn("수행 후 데이터: " + lvo);
		
		if(lvo == null) {      
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/users/login";
        }
        session.setAttribute("user", lvo);      
        return "redirect:/main";
		
	}
}
