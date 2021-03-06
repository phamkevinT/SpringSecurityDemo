<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<title>Custom Login Page</title>
	<style>
		.failed {
			color: red;
		}
	</style>
</head>

<body>

<h3>My Custom Login Page</h3>

	<!-- Login form should POST data to this URL for processing: /authenticateTheUser -->
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser"
			   method="POST">
			   
		<!-- Check for login error -->
		<c:if test="${param.error != null }">
			<i class="failed">Sorry! You entered an invalid username/password.</i>
		</c:if>	   
			   
	   <p>
	   		Username: <input type="text" name="username" />
	   </p>
	   
	   <p>
	   		Password: <input type="password" name="password" />
	   </p>
	   
	   <input type="submit" value="Login" />
	   
			   
	</form:form>

</body>

</html>