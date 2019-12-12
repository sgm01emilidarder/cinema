package com.cinema.service;

import java.util.HashMap;

import com.cinema.dto.Person;
import com.cinema.dto.User;

public class AutheticationService {
	
	HashMap<String, User> dadesUsuaris = new HashMap<>();

	public AutheticationService() {
		Person pedro = new Person("42515256J","Pedro","Sanchez","ps@gmail.com");
		Person joan = new Person("42515256A","Joan","Nicolau","jn@gmail.com");
		Person xavi = new Person("42515256C","Xavi","Perez","xp@gmail.com");

		dadesUsuaris.put("pedro", new User(pedro,"pedro", "pass1", "Pedro Sánchez"));
		dadesUsuaris.put("joan", new User(joan,"joan", "pass2", "Joan Nicolau"));
		dadesUsuaris.put("xavi", new User(xavi,"xavi", "pass3", "Xavi Pérez"));
	}
	
	public User getUsuari (String userId) {
		return dadesUsuaris.get(userId);
	}

	public boolean existUsuari (String userId) {
		return dadesUsuaris.containsKey(userId);
	}

	public boolean validUser (String userId, String userPass ) {
		return dadesUsuaris.containsKey(userId);
	}	

}
