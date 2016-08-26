<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Mostra Tarefa</title>
	<link href="resources/css/jquery.css" rel="stylesheet">
	<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet">
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
</head>
<body>
	<h3>Altera tarefa - ${tarefa.id}</h3>
	
	<form action="alteraTarefa" method="post">
		
		<input type="hidden" name="id" value="${tarefa.id}" />
		Descrição: <br />
		<textarea rows="5" cols="100" name="descricao">
			${tarefa.descricao}
		</textarea>
		<br />
		
		Finalizado? <input type="checkbox" name="finalizado" 
			value="true" ${tarefa.finalizado? 'checked' : ''} />
		<br />
		
		Data de Finalização: <br />
		
		<caelum:campoData id="dataFinalizacao" value="${tarefa.dataFinalizacao.time}"/>
		<br />
		
		<input type="submit" value="Alterar" />
				
	</form>
	
</body>
</html>