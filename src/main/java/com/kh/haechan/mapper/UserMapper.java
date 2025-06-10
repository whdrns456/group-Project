package com.kh.haechan.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.heachan.user.model.UserDTO;
@Mapper
public interface UserMapper {

	 UserDTO selectUser(@Param("usersId") String usersId, @Param("usersPassword") String usersPassword);
	int userInsert(UserDTO user);
	

}
