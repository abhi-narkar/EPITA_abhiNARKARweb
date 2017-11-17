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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<h3>Welcome!</h3>

   
    <div class="jumbotron">
        <div class="container">
            <h1 class="text-info">Welcome to the IAM System </h1><a href="index.jsp">Disconnect</a>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
        
        
            <div class="col-xs-6">
                <h4>Identity Creation</h4>

                <p>Thanks to this action, you can create a brand new Identity, you can click on the button below to
                    begin</p>
              <button> <a href="creation.jsp">Create!</a></button> 
            </div>
           
            
            <div class="col-xs-6">
                <h4>Identity Search</h4>

                <p>Thanks to this action, you can search an identity and then access to its information. Through this
                    action, you can also modify or delete the wished identity</p>
               <button><a href="search.jsp">Search!</a></button>
            </div>
            
        </div>
    </div>
    
</body>
</html>