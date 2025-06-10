package com.kh.haechan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kh.haechan.service.UserService;
import com.kh.heachan.user.model.UserDTO;

@Controller
public class MovePageController {

	private final UserService userService;

	public MovePageController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/")
	public String homePage() {
		return "index";
	}

	@RequestMapping("signup")
	public String signupPage() {
		return "signup/signup";
	}

	@PostMapping("logout")
	@ResponseBody
	public ResponseEntity<String> logout(HttpSession session) {
		session.invalidate();
		return ResponseEntity.ok("success");
	}

	@RequestMapping("loginPage.do")
	public String moveToFirstPage() {
		return "loginPage";
	}

	@PostMapping("userLogin")
	@ResponseBody
	public Map<String, Object> loginData(@RequestBody UserDTO user, HttpSession session) {

		Map<String, Object> result = new HashMap<>();

		String usersId = user.getUsersId();
		String usersPassword = user.getUsersPassword();
		UserDTO users = userService.userLogin(usersId, usersPassword);

		if (users != null) {
			session.setAttribute("loginUser", users);
			result.put("status", "success");
			result.put("message", "로그인 성공");
		} else {
			result.put("status", "fail");
			result.put("message", "아이디 또는 비밀번호가 잘못되었습니다.");
		}
		return result;
	}

	@PostMapping("userSignup")
	@ResponseBody
	public String userSignup(@RequestBody UserDTO user) {
		System.out.println("log 확인 :: " + user);
		int result = userService.userInsert(user);
		if (result > 0) {
			return "success";
		}
		return "fail";
	}

}