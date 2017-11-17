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
					<a href="Search.jsp">Search</a>
				</div>
			</div>

	
	<div class="container">
		<h3 class="text-info">Search Results</h3>

		<form class="form-horizontal"  method="post" action="IdentityModification">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Selection</th>
							<th>ID</th>
							<th>Display Name</th>
							<th>Email</th>
							<th>BirthDate</th>
						</tr>
					</thead>
					<tbody>
					   <%
					   if (identitiesList == null || identitiesList.isEmpty()){%>
						  <tr>
						      <td colspan="4">No result</td>
						  </tr>
						   
					   <% } else{
					   for (Identity id : identitiesList){ %>
						<tr>
							<td><input name="selection" type="radio" value="<%=id.getId()%>"/></td>
							<%-- <td> <label for="id" name="id" id="id" value="<%=id.getId() %>"><%=id.getId() %></label></td> --%>
							<td><%=id.getId() %></td>
							<%-- <td><%=id.getDisplayName() %></td> --%>
							<td><%=id.getDisplayName() %></td>
							<%-- <td><%=id.getEmail() %></td> --%>
							<td><%=id.getEmail() %></td>
							<%-- <td><%=id.getBirthDate() %></td> --%>
							<td><%=id.getBirthDate() %></td>
						</tr>
                        <%} 
                        }%>

					</tbody>
				</table>
			</div>
			<div class="form-group">
				<div class=" col-sm-offset-2 col-sm-10 text-right">
					
					<button type="submit" class="btn btn-primary" value="Modify" name="modify">Modify</button>
					<button type="submit" class="btn btn-primary" value="Delete" name="delete">Delete</button>
					
				</div>
	</div>
	</form>
	</div>
</div>
</body>
</html>
