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
//Intento ver si me ha puesto los datos para añadir un nuevo cine
	Cine c=null;
try{
		c = CineRepository.getCine(request.getParameter("cine"));
		%>
	<%}catch(Exception e){
		//No existe el cine
		
	}
	
%>
	<form action="annadirCine.jsp">
		Cine <input name="cine" type="text">
		ciudadCine <input name="ciudadCine" type="text">
		direccionCine <input name="direccionCine" type="text">
		<button type="submit">Añadir</button>
	</form>
</body>
</html>