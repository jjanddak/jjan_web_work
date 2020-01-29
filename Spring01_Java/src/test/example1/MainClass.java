package test.example1;

import test.mypac.Weapon;
import test.mypac.WeaponImpl;

public class MainClass {
	public static void main(String[] args) {
		//useWeapon()을 호출하는것이 목적일때.
		WeaponImpl w1=new WeaponImpl();
		useWeapon(w1);
		
	}
	
	//Weapon(인터페이스) type을 전달해야 호출할 수 있는 메소드.
	public static void useWeapon(Weapon w) {
		w.attack();
	}
}
