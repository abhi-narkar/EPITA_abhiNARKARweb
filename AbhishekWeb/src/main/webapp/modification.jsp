<%@page import="fr.epita.iam.datamodel.Identity"%>
<%@page import="fr.epita.iam.services.HibernateIdentityDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
  Identity identity = (Identity) session.getAttribute("identity");

  
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

					   <%
					   if (identity == null){%>
						  <tr>
						      <td colspan="4">No result</td>
						  </tr>
						   
					   <% } else{
					    %>	
<body>
		<div class="container">
		<div>
			<div class="jumbotron">
				<div class="container">
					<h1 class="text-info">Identity Modification</h1>
					<a href="Welcome.jsp">Welcome</a>
					<a href="search.jsp">Search</a>
				</div>
			</div>
	<div class="container">
		<div xmlns="http://www.w3.org/1999/xhtml" class="bs-example">
			<form role="form" method="post" action="IdentityUpdate">
			
			   <div class="form-group">
					<label for="exampleInputEmail1">id</label> 
					<input name="id" value="<%=identity.getId()%>" type="text" class="form-control" id="exampleInputEmail1"
						placeholder="enter  id" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Display Name</label> 
					<input name="displayName" value="<%=identity.getDisplayName()%>" type="text" class="form-control" id="exampleInputEmail1"
						placeholder="Enter Display name" />
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Email</label> 
					<input name="email" value="<%=identity.getEmail()%>" type="text" class="form-control" id="exampleInputEmail1"
						placeholder="Enter Email" />
				</div>
				
				
				<div class="form-group">
					<label for="exampleInputEmail1">BirthDate</label> 
					<input name="birthDate" value="<%=identity.getBirthDate()%>" type="date" class="form-control" id="exampleInputEmail1"
						placeholder="Enter Birthdate in this format-> dd/mm/yyyy" />
				</div>
				

				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
							
							
						
                        <%} 
                        %>
                       

</html>
