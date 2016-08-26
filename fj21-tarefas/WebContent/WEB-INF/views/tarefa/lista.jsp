<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lista de Tarefas</title>
	<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
		function finalizarAgora(id) {
			$.post("finalizaTarefa",{'id' : id} ,function(resposta){
				$("#tr_tarefa_"+id).html(resposta);
			})
		}
		function removeTarefa(id) {
			$.post("removeTarefa",{'id' : id} ,function(){
				$("#tr_tarefa_"+id).hide();
			})
		}
	</script>
</head>
<body>
	<a href="adicionaTarefa">Criar nova tarefa</a>
	<a href="menu">Volta Menu</a>
	
	<br /><br />
	
	<table border="1">
		<tr>
			<td>Id</td>
			<td>Descrição</td>
			<td>Finalização</td>
			<td>Data de Finalização</td>
			<td>Remover</td>
			<td>Alterar</td>
		</tr>
		
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tr_tarefa_${tarefa.id}">
				<td>
					${tarefa.id}
				</td>
				<td>
					${tarefa.descricao}
				</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td id="tarefa_${tarefa.id}">
						<a href="#" onclick="finalizarAgora(${tarefa.id})">
							Finalizar Agora!
						</a>
					</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td>
						Finalizado
					</td>
				</c:if>
				<td>
					<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
				</td>
				<td>
					<a href="#" onclick="removeTarefa(${tarefa.id})">Remover</a>
				</td>
				<td>
					<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
				</td>
		</c:forEach>
	</table>
</body>
</html>