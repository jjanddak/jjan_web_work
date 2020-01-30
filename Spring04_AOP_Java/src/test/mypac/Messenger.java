package test.mypac;

import org.springframework.stereotype.Component;

@Component
public class Messenger {
	public void sendGreeting(String msg) {
		System.out.println("오늘의 인사 : "+msg);
		
	}
	
	public String getMessage() {
		return "힘을 내요!!!!!!!!!!!!!!!!";
	}
}
