package com.gura.spring05.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String regdate;
	private String profile; //프로필 이미지 경로를 저장할 필드.
	//디폴트생성ㅈ
	public UsersDto() {}
	
	public UsersDto(String id, String pwd, String email, String regdate, String profile) {
		this.id=id;
		this.pwd=pwd;
		this.email=email;
		this.regdate=regdate;
		this.profile=profile;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
