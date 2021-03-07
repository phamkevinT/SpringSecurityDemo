<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
	
	<form:form action="${pageContext.request.contextPath}/logout"
	           method="POST">
	           
		<input type="submit" value="Logout" />
	           
	</form:form>

</body>
</html>