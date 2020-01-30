package test.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MessengerAspect {
	/*
	 * 리턴 type 은 상관없고
	 * 메소드 명이 send 로 시작하는 메소드 &
	 * 메소드에 전달되는 인자도 상관없다.
	 * 
	 * 위 조건을 만족하는 메소드에 아래의 AOP가 적용된다.
	 */
	@Around("execution(* send*(..))")
	public void around(ProceedingJoinPoint joinPoint) throws Throwable{
		
		//aop가 적용된 메소드 수행 직전
		System.out.println("-- 수행 이전 --");
		
		//aop가 적용된 메소드에 전달된 인자를 Object[] 로 얻어내기.
		Object[] args=joinPoint.getArgs();
		//반복문 돌며 찾고싶은 type 찾기
		for(Object tmp:args) {
			if(tmp instanceof String) {	//tmp가  String type 이면
				//원래 type 으로 casting
				String msg=(String)tmp;
				System.out.println("aop에서 읽어낸 내용 : "+msg);
				if(msg.contains("바보")) {
					System.out.println("바보가 감지됨");
					return;
				}
			}
		}
		
		//aop가 적용된 메소드 수행하고 리턴되는 값 받아오기.(void면 null)
		Object obj=joinPoint.proceed(); //메소드를 실행하는 부분.
		
		//aop가 적용된 메소드 리턴 직후
		System.out.println("-- 리턴 직후 --");
	}	
}
