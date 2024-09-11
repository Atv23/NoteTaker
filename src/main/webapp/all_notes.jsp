<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@ include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session session2 = FactoryProvider.getSessionFactory().openSession();
				Query q = session2.createQuery("from ToDo");
				List<ToDo> list = q.list();
				for (ToDo note : list) {
				%>

				<div class="card mt-3"
					style="border: 2px solid #BDBDBD; border-radius: 5px;">
					<img class="card-img-top pl-4 pt-4 " style="max-width: 80px;"
						src="img/sticky-notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<a href="DeleteServlet?note_id=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="edit.jsp?note_id=<%=note.getId()%>"
							class="btn btn-primary">Update</a>

					</div>
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					String formattedDate = sdf.format(note.getAddeddate());
					%>
					<div class="ml-2 mb-0">
						<p>
							Last Updated: <b class="text-primary"><%=formattedDate%></b>
						</p>
					</div>
				</div>
				<%
				}

				session2.close();
				%>
			</div>
		</div>


	</div>
</body>
</html>