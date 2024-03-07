package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tcc.charitycloset.inf2fm.charityclosetinf2fm.model.UsuarioOng;

@Controller
@RequestMapping("/charitycloset/")

public class LoginController {
	
	@GetMapping("/login")
	public String novoLogin(UsuarioOng usuarioong, Model model) {
		return "html/login";
	}
	
	@PostMapping("/efetuarLogin")
	public String efetuarLogin(UsuarioOng usuarioong) {
		if (usuarioong.getEmail().equals("soulskien@gmail.com") &&
			usuarioong.getSenha().equals("admin")) {
			return "redirect:/charitycloset/perfil-ong";
		} else { return "redirect:/charitycloset/login";}
	}

}
