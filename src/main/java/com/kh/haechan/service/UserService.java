package com.kh.haechan.service;

import org.springframework.stereotype.Service;

import com.kh.haechan.mapper.UserMapper;
import com.kh.heachan.user.model.UserDTO;

@Service
public class UserService {
	
	private final UserMapper userMapper; 
	
	public UserService(UserMapper userMapper){
		this.userMapper = userMapper;
	}
	
	
	public UserDTO userLogin(String usersId, String usersPassword) {
		return userMapper.selectUser(usersId, usersPassword);
	}
	public int userInsert(UserDTO user) {	
		return userMapper.userInsert(user);
	}
	
	
	
}
