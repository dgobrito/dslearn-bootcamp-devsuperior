package com.devsuperior.dslearnbds.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

import com.devsuperior.dslearnbds.components.JwtTokenEnhancer;

@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {
	
	@Value("${security.oauth2.client.client-id}")
	private String clientId;
	
	@Value("${security.oauth2.client.client-secret}")
	private String clientSecret;
	
	@Value("${jwt.duration}")
	private Integer jwtDuration;	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JwtAccessTokenConverter accessTokenConverter;
	
	@Autowired
	private JwtTokenStore tokenStore;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private JwtTokenEnhancer tokenEnhancer;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
		security.tokenKeyAccess("permitAll()").checkTokenAccess("isAuthenticated()");
	}

	// Define como vai ser a autenticação e quais os dados do client, credenciais da aplicação
	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		clients.inMemory() // Sera em memoria
		.withClient(clientId) // Nome da aplicacao ou clientId
		.secret(passwordEncoder.encode(clientSecret)) // Senha da aplicacao
		.scopes("read", "write") // Acesso de leitura e escrita
		.authorizedGrantTypes("password", "refresh_token") // Tipo de acesso = senha
		.accessTokenValiditySeconds(jwtDuration) // Tempo de expiração do token em segundos
		.refreshTokenValiditySeconds(jwtDuration);
	}

	// Quem vai autorizar e qual o formato do token
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		TokenEnhancerChain chain = new TokenEnhancerChain();
		chain.setTokenEnhancers(Arrays.asList(accessTokenConverter, tokenEnhancer));
		
		endpoints.authenticationManager(authenticationManager)
			.tokenStore(tokenStore)
			.accessTokenConverter(accessTokenConverter)
			.tokenEnhancer(chain)
			.userDetailsService(userDetailsService);
	}	
}