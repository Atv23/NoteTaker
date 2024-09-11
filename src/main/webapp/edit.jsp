<%@page import="com.entities.ToDo"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@ include file= "all_js_css.jsp" %>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>
	<br>
		<h1>Edit Your Note</h1>
		<br>
		<%
		int noteId= Integer.parseInt(request.getParameter("note_id").trim());
		
		Session session2 = FactoryProvider.getSessionFactory().openSession();
		ToDo note = session2.get(ToDo.class, noteId);
		
		session2.close();
		
		%>
		
		<form action="UpdateServlet" method="post">
			<label>Note ID:  </label><input value= "<%= note.getId() %>"  name="noteEditId"/>
			<div class="form-group">
				<label for="title">Title</label> <input required
					name= "title"
					type="text" 
					class="form-control" 
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter title"
					value="<%= note.getTitle() %>"/> 
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label> 
				<textarea required 
				name="content"
				id="content" 
				placeholder="Enter content" 
				class="form-control" 
				style="height:300px;"><%= note.getContent()%>
				</textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Edit</button>
			</div>
			
		</form>
	</div>
</body>
</html>