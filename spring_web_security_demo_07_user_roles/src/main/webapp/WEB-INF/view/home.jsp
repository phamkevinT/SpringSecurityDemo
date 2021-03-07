<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>

<html>
<head>
<title>Home</title>
</head>
<body>

	<h2>Home Page</h2>

	<p>
		Welcome to the Home Page!
	</p>
	
	<hr>
	
	<!-- Display user's name and role -->
	
	<p>
		User: <security:authentication property="principal.username"/>
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
		
	<hr>
	
	<form:form action="${pageContext.request.contextPath}/logout"
	           method="POST">
	           
		<input type="submit" value="Logout" />
	           
	</form:form>

</body>
</html>