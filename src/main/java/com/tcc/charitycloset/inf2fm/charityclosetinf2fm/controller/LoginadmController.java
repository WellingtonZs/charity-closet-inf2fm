package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tcc.charitycloset.inf2fm.charityclosetinf2fm.model.UsuarioOng;

@Controller
@RequestMapping("/charitycloset/")
public class LoginadmController {
	
	@GetMapping("/login-adm")
	public String loginAdm(UsuarioOng usuarioong, Model model) {
		return "html/loginadm";
	}
	@GetMapping("/usersadm")
	public String usersAdm(UsuarioOng usuarioong, Model model) {
		return "html/usersadm";
	}
}
