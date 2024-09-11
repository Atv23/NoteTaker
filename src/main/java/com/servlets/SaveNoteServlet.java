package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ToDo;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// title.content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			ToDo note = new ToDo(title, content, new Date());
//			System.out.println(note.getId()+" "+ note.getTitle());

			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.persist(note);
			tx.commit();

			session.close();
			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			pw.println("<h1 style= 'text-align:center;'>Note is added successfully!</h1>");
			pw.println("<div style='text-align:center;'>"
					+ "<a href='all_notes.jsp' style='font-size: 16px; padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; display: inline-block; cursor: pointer;'>"
					+ "View All Notes" + "</a>" + "</div>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
