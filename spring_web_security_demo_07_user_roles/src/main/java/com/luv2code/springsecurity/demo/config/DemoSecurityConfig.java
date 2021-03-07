package com.luv2code.springsecurity.demo.config;

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

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// Add user for in memory authentication (just for demo, will implement with database later)
		UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication().withUser(users.username("john").password("test123").roles("EMPLOYEE"));
		auth.inMemoryAuthentication().withUser(users.username("mary").password("test123").roles("EMPLOYEE", "MANAGER"));
		auth.inMemoryAuthentication().withUser(users.username("susan").password("test123").roles("EMPLOYEE", "ADMIN"));
		
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
