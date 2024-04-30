package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tcc.charitycloset.inf2fm.charityclosetinf2fm.model.UsuarioOng;

@Controller
@RequestMapping("/charitycloset/usuario")
public class UsuarioController {
	
	//carregar o formulário de cadastro
	
	@GetMapping("/novo-usuario")
	public String novoUsuario( Model model) {
		
		model.addAttribute("usuarioOng", new UsuarioOng());
			
		return "html/cadastroong";
	}
		
	@GetMapping("/login")
	public String novoLogin() {
		
		return "html/login";
	}
	
}
