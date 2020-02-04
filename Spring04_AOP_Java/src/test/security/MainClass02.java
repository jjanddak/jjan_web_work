package test.security;

import java.util.Scanner;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MainClass02 {
	public static void main(String[] args) {
		//예전에 입력한 비밀번호라고 가정
		String lastPwd="1234";
		//입력한 비밀번호를 암호화해서 저장된 비밀번호라고 가정하자.
		String encodedPwd=new BCryptPasswordEncoder().encode(lastPwd);
		
		Scanner scan=new Scanner(System.in);
		System.out.println("비밀번호 입력 : ");
		String pwd=scan.nextLine();
		
		//비밀번호 일치 여부를 BCrypt 클래스의 static 메소드로 검증.
		boolean isValid=BCrypt.checkpw(pwd, encodedPwd);
		
		if(isValid) {
			System.out.println("비밀번호가 일치함!");
		}else {
			System.out.println("비밀번호가 틀렸음!");
		}
	}
}
