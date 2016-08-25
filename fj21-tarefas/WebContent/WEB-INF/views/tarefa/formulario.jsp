<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Adiciona Tarefas</title>
	<link href="resources/css/jquery.css" rel="stylesheet">
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
</head>
<body>
	<h3>Adicionar tarefas</h3>
	<form:errors path="tarefa.descricao" />
	<form action="adicionaTarefa" method="post">
		Descrição: <br />
		<textarea rows="5" cols="100" name="descricao" id="descricao"></textarea><br />
		
		Data de Finalização: <br />
		<caelum:campoData id="dataFinalizacao" value="${tarefa.dataFinalizacao.time}"/>
		<br />
		
		
		<input type="submit" value="Adicionar">
	</form>
</body>
</html>