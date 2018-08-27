package com.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.ui.context.ThemeSource;
import org.springframework.ui.context.support.ResourceBundleThemeSource;
import org.springframework.web.servlet.ThemeResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.theme.CookieThemeResolver;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;

import com.alibaba.druid.pool.DruidDataSource;
import com.demo.interceptor.AuthorInterceptor;

@SuppressWarnings("deprecation")
@Configuration
public class AppConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private Environment env;
	
	@Bean(name="dataSource")
	public DataSource getDataSource() {
		
		DruidDataSource dds = new DruidDataSource();
		dds.setUrl(env.getProperty("spring.datasource.url").trim());
		dds.setUsername(env.getProperty("spring.datasource.username").trim());
		dds.setPassword(env.getProperty("spring.datasource.password").trim());
		dds.setDriverClassName(env.getProperty("spring.datasource.driver-class-name").trim());
		return dds;	
	}
	
	@Bean("themeSource")
	public ThemeSource getThemeSource() {
		ResourceBundleThemeSource bundleThemeSource = new ResourceBundleThemeSource();
		bundleThemeSource.setBasenamePrefix("com.spring_boot.theme.");
		return bundleThemeSource;
	}

	@Bean("themeResolver")
	public ThemeResolver getCookie() {
		CookieThemeResolver cookThemeResolver = new CookieThemeResolver();
		cookThemeResolver.setDefaultThemeName("sketchy");
		return cookThemeResolver;
	}
	
	


	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ThemeChangeInterceptor());
		registry.addInterceptor(new AuthorInterceptor());
	}

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/upload/**").addResourceLocations("/WEB-INF/upload/");
	}
}
