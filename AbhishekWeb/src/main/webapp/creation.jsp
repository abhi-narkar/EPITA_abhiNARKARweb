<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<div>
			<div class="jumbotron">
				<div class="container">
					<h2 class="text-info">Creation</h2>
					
				</div>
	
	<div class="container">
		<form xmlns="http://www.w3.org/1999/xhtml" class="form-horizontal" role="form" action="IdentityCreation" method="post">
        <div class="form-group">
            <label for="firstName" class="col-sm-2 control-label">Display Name </label>

            <div class="col-sm-10">
                <input type="text" name="displayName" class="form-control" id="firstName" placeholder="Display Name" />
            </div>
        </div>
        <div class="form-group">
            <label for="lastName" class="col-sm-2 control-label">Email</label>

            <div class="col-sm-10">
                <input type="email" name="email" class="form-control" id="email" placeholder="Email" />
            </div>
        </div>

        <div class="form-group">
            <label for="date" class="col-sm-2 control-label">Birth Date</label>

            <div class="col-sm-10">
                <input type="date" name="date" class="form-control" id="date" placeholder="Birth Date" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Submit</button>
            </div>
            
            <a href="welcome.jsp">Welcome</a>
			<a href="search.jsp">Search</a>
        </div>
    </form>
	</div>
</body>
</html>
