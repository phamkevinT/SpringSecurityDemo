<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
<title>Custom Login Page</title>
</head>

<body>

<h3>My Custom Login Page</h3>

	<!-- Login form should POST data to this URL for processing: /authenticateTheUser -->
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser"
			   method="POST">
			   
	   <p>
	   		Username: <input type="text" name="username" />
	   </p>
	   
	   <p>
	   		Password: <input type="text" name="password" />
	   </p>
	   
	   <input type="submit" value="Login" />
	   
			   
	</form:form>

</body>

</html>