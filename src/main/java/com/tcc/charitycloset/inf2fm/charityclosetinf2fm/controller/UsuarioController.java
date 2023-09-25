package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/charitycloset/usuario")
public class UsuarioController {
	
	//carregar o formulário de cadastro
	
	@GetMapping("/novo-usuario")
	public String novoUsuario() {
		
		return "html/cadastrodoador";
	}
	
	@GetMapping("/login")
	public String novoLogin() {
		
		return "html/login";
	}
	
}
