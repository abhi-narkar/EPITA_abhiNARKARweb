<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>           
<body>                           
	<h2>Authentication</h2>
	<div class="container">
		<form name="authenticationForm" action="Authenticate" method="post">
			<div class="form-group">
				<label>login</label> <input class="form-control" type="text"
					name="firstName" />
					
			</div>
			<div class="form-group">
				<label>password</label> <input class="form-control" type="password"
					name="password" />
			</div>
			
			<input type="submit"/>
		</form>
	</div>
</body>
</html>
