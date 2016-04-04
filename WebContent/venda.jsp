<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Sistema de Venda Web</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>

<header>
<h3>cabeçalho</h3>

	<nav>
       <ul class="menu">
           <li><a href="inicio.html">Início</a></li>
           <li><a href="quem-somos.html">Quem somos</a></li>
           <li><a href="servicos.html">Serviços</a></li>
           <li><a href="contato.html">Contato</a></li>
       </ul>
	</nav>

</header>

		<section>
		
			<label for="cliente">Cliente:</label>
			<select id="cliente">
			 <c:forEach var="cliente" items="${clientes}">
			 	<option value="${cliente.id }">${cliente.nome }</option>
			 </c:forEach>				  			
			</select>
			 <br />
			    <label for="dataVenda">Data da Venda:</label> 
				<input id="dataVenda" type="date" name="dataVenda"  />			  			 				
		</section>
		<br />
		<section>
			<h2>Incluir Produto</h2>
				<form action="#">
				
				<label for="produto">Produto:</label>
					<select id="produtoS">
					 <c:forEach var="produto" items="${produtos}" varStatus="loop">
					 	<option value="${produto.preco}">${produto.descricao }</option>
					 </c:forEach>				  			
					</select>
					
				<label for="qtd">QTD:</label>					  
				<input type="text" id="qtd" name="qtd" value="0" ><br>
				  <br>
				<label for="precoUnitario">Preço</label>					  
				<input type="text" id="precoUnitario" name="precoUnitario" readonly ><br>
				
				<label for="totalUnitario">Total</label>					  
				<input type="text" id="totalUnitario" name="totalUnitario"  readonly><br>  
				  
				<button type="submit" class="btn btn-default">Adicionar</button><br />
				</form>
			<div></div>
		</section>
		<br />
		<section>
			Lista de Itens
		</section>
	


<footer><h3>rodapé</h3>



 

</footer>

<!-- seleciona do select -->
<script>
$( "#produtoS" )
  .change(function () {
    var str = "";
    var opcao = "";
    $( "#produtoS option:selected" ).each(function() {
      opcao = $('#produtoS').val();	                
    });
    $( "input[name=precoUnitario]" ).val( opcao );    
  })
  .change();
</script>
 
 <!-- multiplica valores -->
 <script type="text/javascript">
	$(document).ready( function() {
		
		$('#qtd').keyup(function(){
			
			var precoUnitario = $('#precoUnitario').val().trim(); 
			var qtd = $('#qtd').val().trim(); 	
			
			if(precoUnitario == "") precoUnitario = 0;
			if(qtd == "") qtd = 0;
			
			var resultado 	= parseFloat(precoUnitario) * parseFloat(qtd);
			$('#totalUnitario').val(resultado);
		})
		 
	});
</script>
 
</body>
</html>