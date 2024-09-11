<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

 
<title>Note Taker : Home Page</title>
	<%@ include file= "all_js_css.jsp" %>
</head>


<body>
	<div class="container text-center">
		<%@ include file="navbar.jsp"%>
	<br>
		<h1>Welcome to Note Taker App</h1>
		
		<div class= "card my-5">
			<img alt="" class="img-fluid mx-auto " style="max-width:400px" src="img/notebook.png">
			<h2 class="text-primary text-uppercase text-center mt-3">Enter a note</h2>
			<div class="container text-center">
			<button class="btn btn-outline-primary text-center" onclick="window.location.href='add_notes.jsp';">Start</button>
		</div>
		</div>
		
	</div>


</body>
</html> 