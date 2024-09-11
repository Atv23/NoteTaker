package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ToDo;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title= request.getParameter("title");
			String content = request.getParameter("content");
			int editId= Integer.parseInt(request.getParameter("noteEditId").trim());
			
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			ToDo note = session.get(ToDo.class, editId);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddeddate(new Date());
			
			tx.commit();
			session.close();
			
			response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
