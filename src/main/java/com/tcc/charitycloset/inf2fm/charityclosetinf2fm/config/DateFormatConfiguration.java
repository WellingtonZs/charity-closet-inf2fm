package com.tcc.charitycloset.inf2fm.charityclosetinf2fm.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class DateFormatConfiguration implements WebMvcConfigurer {
	
	@Override
	public void addFormatters(FormatterRegistry registry) {
		
		DateTimeFormatterRegistrar registrar = new DateTimeFormatterRegistrar();
		registrar.setUseIsoFormat(true);
		registrar.registerFormatters(registry);
		
	}

}
