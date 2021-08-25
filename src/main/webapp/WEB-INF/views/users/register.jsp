<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>회원가입</title>
	<link rel="stylesheet" href="/resources/css/users/register.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
	<form id="reg_form" method="post">
		<div class="wrap">
			<div class="main_title">
				<span>회원 가입</span>
			</div>
			<div class="content id_wrap">
				<div class="definition id_definition">아이디</div>
				<div class="input_box id_input_box">
					<input class="input id_input" name="userId" placeholder="아이디 입력">
				</div>
				<!-- 아이디 중복검사 기능 -->
				<span class="id_input_NotDuplicate">사용 가능한 아이디 입니다.</span>
				<span class="id_input_Duplicate">이미 존재하는 아이디 입니다.</span>
				<span class="warn warn_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="content pw_wrap">
				<div class="definition pw_definition">비밀번호</div>
				<div class="input_box pw_input_box">
					<input type="password" class="input pw_input" name="userPw" placeholder="비밀번호 입력">
				</div>
				<span class="warn warn_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="content pwcf_wrap">
				<div class="definition pwcf_definition">비밀번호 확인</div>
				<div class="input_box pwcf_input_box">
					<input type="password" class="input pwcf_input" placeholder="비밀번호 확인">
				</div>
				<span class="warn warn_pwcf_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwcf_input1">비밀번호가 일치합니다.</span>
				<span class="pwcf_input2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="content user_wrap">
				<div class="definition user_definition">이름</div>
				<div class="input_box user_input_box">
					<input class="input user_input" name="userName" placeholder="이름을 입력">
				</div>
				<span class="warn warn_name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="content mail_wrap">
				<div class="definition mail_definition">이메일</div>
				<div class="input_box mail_input_box">
					<input type="email" class="input mail_input" name="userMail" placeholder="이메일 입력">
				</div>
				<span class="warn warn_mail_ck">이메일을 입력해주세요.</span>
				<span class="warn_mail_span"></span>
				<div class="content mail_verify_wrap">
					<div class="input_box mail_verify_box" id="mail_verify_box_false">
						<input type="text" class="input mail_verify_input" placeholder="인증번호 입력" disabled="disabled">
					</div>
					<div class="mail_verify_btn">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_verify_box_warn"></span>
				</div>
			</div>
			
			<div class="content addr_wrap">
				<div class="definition addr_definition">주소</div>
				<div class="addr_input1_wrap">
					<div class="input_box addr_input1_box">
						<input class="input addr_input1" name="userAddr1" placeholder="우편번호" readonly="readonly">
					</div>
					<div class="addr_btn" onclick="daum_addr()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="content addr_input2_wrap">
					<div class="input_box addr_input2_box">
						<input class="input addr_input2" name="userAddr2" placeholder="주소" readonly="readonly">
					</div>
				</div>
				<div class="content addr_input3_wrap">
					<div class="input_box addr_input3_box">
						<input class="input addr_input3" name="userAddr3" placeholder="상세주소" readonly="readonly">
					</div>
				</div>
				<span class="warn warn_addr_ck">주소를 입력해주세요.</span>
			</div>
			<div class="reg_btn_wrap">
				<input type="button" class="reg_btn" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
let code = "";

/**
 * 유효성 검사 문항
 */
 let idCheck = false;//아아디
 let idDpCheck = false;//중복검사
 let pwCheck = false;//비밀번호
 let pwcfCheck = false;//비밀번호 확인
 let nameCheck = false;//이름
 let mailCheck = false;//이메일
 let mailnumCheck = false;//이메일 인증번호 확인
 let addrCheck = false;//주소

$(document).ready(function() {
	//회원가입 버튼
	$(".reg_btn").click(function() {
		/* 입력값 변수들 */
		let id = $('.id_input').val();
		let pw = $('.pw_input').val();
		let pwcf = $('.pwcf_input').val();
		let name = $('.user_input').val();
		let mail = $('.mail_input').val();
		let addr = $('.addr_input3').val();
		
		
		
		//아이디 유효성 검사
		if(id == "") { //아무것도 입력하지 않았다면
			$('.warn_id_ck').css("display", "block");
			idCheck = false;
		} else {
			$('.warn_id_ck').css('display', 'none');
			idCheck = true;
		}
		
		//비밀번호 유효성 검사
		if(pw == "") {
			$('.warn_pw_ck').css("display", "block");
			pwCheck = false;
		} else {
			$('.warn_pw_ck').css("display", "none");
			pwCheck = true;
		}
		
		//비밀번호 확인 유효성 검사
		if(pwcf == "") {
			$('.warn_pwcf_ck').css("display", "block");
			pwcfCheck = false;
		} else {
			$('.warn_pwcf_ck').css("display", "none");
			pwcfCheck = true;
		}
		
		//이름 유효성 검사
		if(name == "") {
			$('.warn_name_ck').css('display', 'block');
			nameCheck = false;
		} else {
			$('.warn_name_ck').css('display', 'none');
			nameCheck = true;
		}
		
		//이메일 유효성 검사
		if(mail == "") {
			$('.warn_mail_ck').css('display', 'block');
			mailCheck = false;
		} else {
			$('.warn_mail_ck').css("display",'none');
			mailCheck = true;
		}
		
		//주소 유효성 검사 
		if(addr == "") {
			$('.warn_addr_ck').css('display', 'block');
			addrCheck = false;
		} else {
			$('.warn_addr_ck').css("display", "none");
			addrCheck = true;
		}
		
		//최종
		if(idCheck&&idckCheck&&pwCheck&&pwcfCheck&&nameCheck&&mailCheck&&mailnumCheck&&addrCheck) {
			$('#reg_form').attr("action", "/users/register");
			$('#reg_form').submit();
		} else {
			alert("모든 값을 입력하세요.");
		}
		
	});//함수 종료
	
	//비밀번호 일치 유효성 검사
	$('.pwcf_input').on("propertychange change keyup paste input", function() {
		let pw = $('.pw_input').val();
		let pwcf = $('.pwcf_input').val();
		$('warn_pwcf_ck').css("display", "none");
		
		if(pw != pwcf) {
			$('.pwcf_input1').css('display', 'none');
			$('.pwcf_input2').css('display', 'block');
			pwcfCheck = false;
		} else {
			$('.pwcf_input1').css('display', 'block');
			$('.pwcf_input2').css('display', 'none');
			pwcfCheck = true;
		}
	});
	
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function() {
		//console.log("keyUp TEST~~");
		let userId = $('.id_input').val();//.id_input에 들어있는 값
		let data = {userId: userId};//컨트롤러에게 전달할 데이터
		
		$.ajax({
			type: "post",
			url: "/users/userIdCheck",
			data: data,
			success: function(result) {
				//console.log("성공여부" + result);
				//만약 중복되는 아이디면 (fail이면)
				if(result != 'success') {
					$('.id_input_Duplicate').css("display", "inline-block");
					$('.id_input_NotDuplicate').css("display", "none");
					idckCheck = false;
				} else {
					$('.id_input_Duplicate').css("display", "none");
					$('.id_input_NotDuplicate').css("display", "inline-block");
					idckCheck = true;
				}
			}//success종료
		})//ajax종료
	})//함수 종료
	
	//인증메일 전송
	$('.mail_verify_btn').click(function() {
		let email = $('.mail_input').val();
		let checkBox = $(".mail_verify_input");
		let boxWrap = $(".mail_verify_box");
		let emailForm = $('.warn_mail_span');
		
		//이메일 형식 유효성 검사
		if(mailFormatCheck(email)) {
			emailForm.html("이메일이 전송되었습니다. 이메일을 확인하세요.");
			emailForm.css("display", "inline-block");
		} else {
			emailForm.html("올바르지 못한 이메일 방식입니다.");
			eamilForm.css("display", "inline-block");
		}
		
		$.ajax({
			type: 'GET',
			url: 'mailCheck?email=' + email,
			success: function(data) {
				//console.log("data = " + data);
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "mail_verify_box_true");
				code = data;
			}
		})
	})//함수 종료
	
	//인증번호 비교
	$('.mail_verify_input').blur(function() {
		let inputCode = $(".mail_verify_input").val();
		
		let checkResult = $("#mail_verify_box_warn");
		
		if(inputCode != code) {
			checkResult.attr("class", "incorrect");
			checkResult.html("인증번호를 다시 확인하세요.");
			mailnumCheck = false;
		} else {
			checkResult.attr("class", "correct");
			checkResult.html("인증번호가 일치합니다.");
			mailnumCheck = true;
		}
	})//함수 종료
});

//다음 주소 찾기 연동 API
function daum_addr() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            let addr = ""; //주소 변수
           	let extraAddr = ""; //참고항목 변수
           	
          	//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          	if (data.userSelectedType === 'R') { //사용자가 도로명 주소를 선택했을 경우
          		addr = data.roadAddress;
          	} else { //사용자가 지번 주소를 선택했을 경우(J)
          		addr = data.jibunAddress;
          	}
          	if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열을 결합한다.
                addr += extraAddr;
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
                addr += "";
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            $('.addr_input1').val(data.zonecode);
            //document.getElementById("sample6_address").value = addr;
            $('.addr_input2').val(addr);
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
            $('.addr_input3').attr("readonly", false);
            $('.addr_input3').focus();
          
        }
    }).open();
}//함수 종료

/* 입력 이메일 형식 유효성 검사 */
function mailFormatCheck(email) {
	let form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}
</script>
</body>
</html>
