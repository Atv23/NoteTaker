<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@ include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>
		<br>
		<h1>Fill the details of your Note</h1>
		<br>

		<!-- this is add form -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Title</label> <input required
					name= "title"
					type="text" 
					class="form-control" 
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter title"/> 
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label> 
				<textarea required 
				name="content"
				id="content" 
				placeholder="Enter content" 
				class="form-control" 
				style="height:300px;"></textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Add</button>
			</div>
			
		</form>
	</div>
</body>
</html>