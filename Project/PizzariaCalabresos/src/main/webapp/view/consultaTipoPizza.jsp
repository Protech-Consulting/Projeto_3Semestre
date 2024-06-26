<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.PizzaBeans"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Consulta Pizza</title>
<script defer src="./JS/select.js"></script>
</head>
<body>
<select class="form-select" aria-label="Default select example" id="selectTipoPizza">
	  <option selected>Selecione Tipo</option>
	  <option value="doce">Doce</option>
	  <option value="salgada">Salgada</option>
	  <option value="todas">Todos os tipos</option>
</select>
<div class="container d-flex flex-wrap">
	<%
	ArrayList<PizzaBeans> listaPizza = (ArrayList<PizzaBeans>) request.getAttribute("pizzas");
	for (int i = 0; i < listaPizza.size(); i++) {
	%>
	

	<div class="card mx-3 my-4 shadow" style="width: 18rem">
	<img src="<%=listaPizza.get(i).getCaminho_img_Pizza()%>" class="card-img-top">
		<div class="card-body">
			<p><%=listaPizza.get(i).getId_Pizza()%></p>
			<h5 class="card-title"><%=listaPizza.get(i).getNome_Pizza()%></h5>
			<div class="shadow-lg p-3 mb-5 bg-white rounded">
			<h6 class="">Ingredientes</h6>
			<br>
			<p class="card-text"><%=listaPizza.get(i).getDescricao_Pizza()%></p>
			</div>
			<h4 class="font-weight-bold text-center">Valor: R$ <%=listaPizza.get(i).getValor_Pizza()%></h4>
			<%= listaPizza.get(i).isEstoque_Pizza()%> <br>
			<%= listaPizza.get(i).getTipo_Pizza()%> <br>
			<br> <a href="#" class="btn btn-danger">Confira</a>
		</div>
	</div>
	<%
	}
	%>
</div>
</body>
</html>