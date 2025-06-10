package com.kh.heachan.user.model;

public class UserDTO {

	private String usersId; 
	private String usersPassword;
	private String usersName;
	
	public UserDTO() {}

	public String getUsersName() {
		return usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getUsersPassword() {
		return usersPassword;
	}
	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}
	
/*	
    @NotBlank(message = "아이디는 필수입니다.")
    private String userId;

    @Size(min = 8, max = 15, message = "비밀번호는 8~15자 사이여야 합니다.")
    private String password;
 */
	
	
	
}
