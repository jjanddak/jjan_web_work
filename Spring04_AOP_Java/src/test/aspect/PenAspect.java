package test.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect // aspect 역할을 할 수 있도록 어노테이션.
@Component	//bean이 될 수 있도록 어노테이션.
public class PenAspect {
	/*
	 * spring이 관리하는 객체의 메소드 중에서
	 * 리턴 type 은 void 메소드명은 write1
	 * 메소드에 전달되는 인자는 없는 메소드의
	 * 수행 이전에 할 작업
	 * 
	 */
	@Before("execution(void write*())") //(이런 모양을 갖고있는) 스프링이 관리하고있는 객체의 메소드 수행 '전'
	public void prepare() {
		System.out.println("Pen을 준비해요@!!!@!#!@");
	}
}
