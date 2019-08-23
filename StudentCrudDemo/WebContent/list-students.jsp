<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<title>Student Crud Demo</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>



<body>

	<div id="wrapper">
		<div id="header">
			<h2 align="center">Coders Classic Academy</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
		
			<!-- add new button : Add Student -->
			<input type="button" value="Add Student" onClick="window.location.href='add-student-form.jsp'; return false;" 
			class="add-student-button" />
			
			<table border="1">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="student" items="${students}">
				<!-- set up a link for each student -->
				<c:url var="tempLink" value="StudentControllerServlet">
					<c:param name="command" value="LOAD" />
					<c:param name="studentId" value="${student.id}" />
				</c:url>
				
				<!-- set up a link to delete student -->
				<c:url var="deleteLink" value="StudentControllerServlet">
					<c:param name="command" value="DELETE" />
					<c:param name="studentId" value="${student.id}" />
				</c:url>
					<tr>
						<td>${student.firstName}</td>
						<td>${student.lastName}</td>
						<td>${student.email}</td>
						<td>
							<a href="${tempLink}">Update</a>
							 |
							<a href="${deleteLink}" onClick="if(!(confirm('Are you sure you want a to delete this student?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>