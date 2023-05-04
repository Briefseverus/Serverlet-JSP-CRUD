package com.example.controllers;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.example.controllers.MegazineController;

public class WebAppInitializer implements ServletContextListener {

	
		@Override
		public void contextDestroyed(ServletContextEvent arg0) {
			MegazineController controller = new MegazineController();
			
		}

		@Override
		public void contextInitialized(ServletContextEvent arg0) {
			// TODO Auto-generated method stub
			
		}
}
