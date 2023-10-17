<%@page import="com.jacaranda.repository.CineRepository"%>
<%@page import="com.jacaranda.model.Cine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
try{
		Cine c = new Cine(request.getParameter("cine"),request.getParameter("ciudadCine"), request.getParameter("direccionCine") );
		CineRepository.deleteCine(c);
		%>
		<div>Eliminado cine</div>
	<%}catch(Exception e){
		//dos posibility que no pase na o falla al añadir
		
	}
	
%>
	<form action="deleteCine.jsp">
		Cine <input name="cine" type="text">
		ciudadCine <input name="ciudadCine" type="text">
		direccionCine <input name="direccionCine" type="text">
		<button type="submit">Añadir</button>
	</form>
</body>
</html>