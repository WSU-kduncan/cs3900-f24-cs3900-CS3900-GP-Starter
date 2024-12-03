package com.wsu.workorderproservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

<<<<<<< HEAD
@SpringBootApplication
=======
@SpringBootApplication()
>>>>>>> 1682d21cf6b5383f0b10cb0c0c15bed870e2826b
public class WorkOrderProServiceApplication {

	/**
	 * SpringBoot Starter method on embedded tomcat server
	 * @param args - Allow to pass String array JVM arguments to set value dynamically during runtime
	 */
	public static void main(String[] args) {
		SpringApplication.run(WorkOrderProServiceApplication.class, args);
	}

}
