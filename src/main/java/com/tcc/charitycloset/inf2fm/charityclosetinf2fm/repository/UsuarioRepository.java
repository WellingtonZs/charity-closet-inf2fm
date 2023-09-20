package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tcc.charitycloset.inf2fm.charityclosetinf2fm.model.UsuarioDoador;

@Repository
public interface UsuarioRepository extends JpaRepository<UsuarioDoador, Long> {

}