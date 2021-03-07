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

	
	<!-- Anything between these tags are shown only to those with specified role -->
	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to point to /leaders ... this is for the managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
			(Only for Managers)
		</p>
	</security:authorize>
	
	<!-- Anything between these tags are shown only to those with specified role -->
	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems ... this is for admins -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admins)
		</p>
			
	</security:authorize>
	
	
	<hr>
	<form:form action="${pageContext.request.contextPath}/logout"
	           method="POST">
	           
		<input type="submit" value="Logout" />
	           
	</form:form>

</body>
</html>