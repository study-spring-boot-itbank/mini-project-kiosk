package com.mini.pan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class FeignCApplication {

	public static void main(String[] args) {
		SpringApplication.run(FeignCApplication.class, args);
	}

}
