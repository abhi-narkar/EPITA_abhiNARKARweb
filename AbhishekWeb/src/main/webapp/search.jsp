<%@page import="fr.epita.iam.datamodel.Identity"%>
<%@page import="fr.epita.iam.services.HibernateIdentityDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% List<Identity> identitiesList = (List<Identity>)session.getAttribute("identitiesList");

  session.removeAttribute("identitiesList");
%>
<head>
<%
	Boolean auth = (Boolean) session.getAttribute("authenticated");
	if (auth == null || !auth) {
%>
<meta http-equiv="refresh" content="0; URL=index.jsp">
<%
	}
%>

<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
		<div>
			<div class="jumbotron">
				<div class="container">
					<h1 class="text-info">Identity Search</h1>
					<a href="welcome.jsp">Welcome</a>
					
				</div>
			</div>

	<div class="container">

		<h3 class="text-info">Search Criteria</h3>
	</div>


	<form class="form-horizontal" role="form" method="post" action="SearchIdentity">
		<div class="form-group">
			<label for="displayName" class="col-sm-2 control-label">Display Name</label>

			<div class="col-sm-10">
				<input name="displayName" type="text" class="form-control" id="displayName"
					placeholder="Display Name" />
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email</label>

			<div class="col-sm-10">
				<input name="email" type="text" class="form-control" id="email"
					placeholder="Email" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10 text-right">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
		</div>
	</form>
	
	
	
	</div>
	</div>
</div>
</body>
</html>
