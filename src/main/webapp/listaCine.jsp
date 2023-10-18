<%@page import="com.jacaranda.repository.CineRepository"%>
<%@page import="com.jacaranda.model.Cine"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList <Cine> result=null;
	//Intento ver si me ha puesto los datos para añadir un nuevo cine
	try{
		result=(ArrayList<Cine>) CineRepository.getCinemas();
		%>
		<div>Añadido cine</div>
	<%}catch(Exception e){
		//dos posibility que no pase na o falla al añadir
		
	}
	
%>
	<ul>
	<%for(Cine c: result){ %>
		<li> <%=c.getCine()%></li> 
	<%} %>
	</ul>
</body>
</html>