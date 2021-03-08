package com.luv2code.springsecurity.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	// Add reference to our security data source
	@Autowired
	private DataSource securityDataSource;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// Use JDBC authentication 
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/leaders/**").hasRole("MANAGER") // Restrict "leaders" page access to only managers 
			.antMatchers("/systems/**").hasRole("ADMIN") // Restrict "systems" page access to only admin
			.and()
			.formLogin()
				.loginPage("/showMyLoginPage")	// Show our custom login form at this request mapping
				.loginProcessingUrl("/authenticateTheUser")	// Login form should POST data to this URL for processing
				.permitAll() // Allow everyone to see the login form.
			.and()
			.logout().permitAll() // Enable logout support
			.and() 
			.exceptionHandling().accessDeniedPage("/access-denied"); // login access denied page
	}
	
	
	

	
}
