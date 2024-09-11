package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	public static SessionFactory sf;
	
	public static SessionFactory getSessionFactory()
	{
		if(sf==null)
		{
			sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
				return sf;
	}
	
	public void closeSessionFactory()
	{
		if(sf.isOpen())
			sf.close();
	}
}
