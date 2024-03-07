package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tcc.charitycloset.inf2fm.charityclosetinf2fm.model.UsuarioOng;

@Controller
@RequestMapping("/charitycloset/")
public class PerfilongController {

	@GetMapping("/perfil-ong")
	public String exibirPerfilong(UsuarioOng usuarioong, Model model) {
		return "html/perfilong";
	}
}
