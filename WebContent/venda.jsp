<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Sistema de Venda Web</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>


<style type="text/css">
#main {
	width: 700px; margin: 0 auto;
}
</style>

</head>


<body>
<div id="main">
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
				<form action="" method="post" id="form_prepare">
				<fieldset>				
					<label for="produto">Produto:</label>
						<select id="produtoS">
						 <c:forEach var="produto" items="${produtos}" varStatus="loop">
						 	<option  value="${produto.preco}-${produto.id}-${produto.descricao}">${produto.descricao }</option>
						 </c:forEach>				  			
						</select>
						
					<label for="qtd">QTD:</label>					  
					<input type="text" id="qtd" name="qtd" value="0" ><br>
					  <br>
					<label for="precoUnitario">Preço</label>					  
					<input type="text" id="precoUnitario" name="precoUnitario" readonly ><br>
					
					<label for="totalUnitario">Total</label>					  
					<input type="text" id="totalUnitario" name="totalUnitario"  readonly><br>  
					  
					<label><input type="submit" name="ok" value="INCLUIR PRODUTO" /></label>
				</fieldset>
				</form>
			 
		</section>
		<br />
		<section>
			Lista de Itens
			
			
		<table id="grid">
			<thead>
				<tr>
					<th>Produto</th>
					<th>QTD</th>				 
					<th>TOTAL</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table><!-- /grid -->		
	
		<h2>TOTAL DA VENDA: </h2>
		<input type="text" id="totalVenda" name="totalVenda"  readonly><br>  
		
		
		<form action="/VendaWEB/servletTabela" method="post" id="form_insert">
			<fieldset Style="display: none;"></fieldset>
			<label><input type="submit" name="cadastrar" value="Finalizar Venda" /></label>
		</form><!-- /form_insert -->
 

	</section>
 

<footer><h3>rodapé</h3>








</footer>
 

<!-- seleciona do select -->
<script>
$( "#produtoS" )
  .change(function () {
 
    var opcao = "";
    var preco = "";
    var id = "";
    $( "#produtoS option:selected" ).each(function() {
      opcao = $('#produtoS').val();
      var sub = opcao.split("-");
      preco = sub[0];
      id = sub[1];
    });
    
    $( "input[name=precoUnitario]" ).val( preco );    
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
 
<script type="text/javascript">
$(document).ready( function() {
	var totalVenda = 0.0;
	$('#form_prepare').submit(function(){
		var $this = $( this );
		 	
			var opcao = "";
		    var preco = "";
		    var id = "";
		    var descricao = "";
		  $( "#produtoS option:selected" ).each(function() {
			  opcao = $('#produtoS').val();
		      var sub = opcao.split("-");
		      preco = sub[0];
		      id = sub[1];
		      descricao = sub[2];
		    });
		
		var idProd = id,
		qtd = $this.find("input[name='qtd']").val(),
		totalUnitario = $this.find("input[name='totalUnitario']").val();
			<!-- telefone = $this.find("input[name='telefone']").val(); -->
	 	totalVenda = totalVenda + parseFloat(totalUnitario);
	 	
		var tr = '<tr>'+
			'<td>'+descricao+'</td>'+
			'<td>'+qtd+'</td>'+
			'<td>'+totalUnitario+'</td>'+			 
			'</tr>'
		$('#grid').find('tbody').append( tr );

			var idCliente = "";
		 $( "#cliente option:selected" ).each(function() {
			 idCliente = $('#cliente').val();		    
		    });	
			
		 var dataVenda = $("#dataVenda").val();
		 
		var hiddens = '<input type="hidden" name="dataVenda" value="'+dataVenda+'" />'+
		'<input type="hidden" name="idCliente" value="'+idCliente+'" />'+
		'<input type="hidden" name="qtd[]" value="'+qtd+'" />'+
		'<input type="hidden" name="id[]" value="'+idProd+'" />';

		$('#form_insert').find('fieldset').append( hiddens );


$("#totalVenda").val("TOTAL VENDA: "+totalVenda);

		return false;
	});
});
</script>
 </div><!-- /main -->
</body>
</html>