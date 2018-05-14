package distributedapp.servermanager.interfaces;

import java.rmi.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Client {
		@SuppressWarnings("deprecation")
		public static void main(String[] args) {
			System.setProperty("java.security.policy","C:\\CodeRepositoryJavaEE\\distributed_app\\src\\java.policy");
			
			if(System.getSecurityManager() == null) {
				System.setSecurityManager(new RMISecurityManager());
			}
			
			try {
				
				Registry reg = LocateRegistry.getRegistry("192.168.100.11");
				ServerManagerInterface s = (ServerManagerInterface)reg.lookup("ServerManagerInterface");
			
				//ServerManagerInterface s = (ServerManagerInterface)Naming.lookup("rmi://10.20.0.114/ServerManagerInterface");
				String message = "Do you see me ... :) ?";
				s.sendMessage(message);
				
				User u = new User();
				u.setAddress("addr");
				u.setBirthdate("bday");
				u.setCountry("country");
				u.setEmail("email");
				u.setFirstName("firstname");
				u.setLastName("lastname");
				u.setPassword("password");
				u.setPhone("phone");
				u.setUsername("name");
				u.setZipcode("zipcode");
				s.insertUser(u);
				System.out.println("Sunt aici !");
			} catch(Exception e) {
				System.err.println("[Eroare]" + e.getMessage());
			}
		}
}
