<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<style>
.error {
	color: red;
	font-weight:bold;
}
</style>
</head>
<body>
 <div align="center">
	<form action="netSalary" method="post">
		<table>
			<tr>
				<td>Associate Id</td>
				<td><input type="text" name="associateId"></td>
				<td><input type="submit" value="Click"></td>
				<td><a href="index">||Home||</a></td>
			</tr>
			</table>
		</form>
 </div>
   <div align="center" class="error">${errorMessage}</div>
	<br>
	<br>
	
	<table>
	<tr>
				<td>${associate.salary.netSalary}</td>
				</tr>
			
	</table>
	</body>
	</html>