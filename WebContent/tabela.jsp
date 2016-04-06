<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	alert("teset");
	$('#form_prepare').submit(function(){
		var $this = $( this );

		var nome = $this.find("input[name='nome']").val(),
			email = $this.find("input[name='email']").val(),
			telefone = $this.find("input[name='telefone']").val();

		var tr = '<tr>'+
			'<td>'+nome+'</td>'+
			'<td>'+email+'</td>'+
			'<td>'+telefone+'</td>'+
			'</tr>'
		$('#grid').find('tbody').append( tr );

		var hiddens = '<input type="text" name="nome[]" value="'+nome+'" />'+
			'<input type="hidden" name="email[]" value="'+email+'" />'+
			'<input type="hidden" name="telefone[]" value="'+telefone+'" />';

		$('#form_insert').find('fieldset').append( hiddens );

		return false;
	});
});
</script>

<style type="text/css">
#main {
	width: 700px; margin: 0 auto;
}
</style>

</head>
<body>
	<div id="main">
		<form action="" method="post" id="form_prepare">
			<fieldset>
				<label>Nome: <input type="text" name="nome" /></label>
				<label>Telefone: <input type="text" name="email" /></label>
				<label>Email: <input type="text" name="telefone" /></label>

				<label><input type="submit" name="ok" value="Ok" /></label>
			</fieldset>
		</form><!-- /form_prepare -->

		<table id="grid">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Telefone</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table><!-- /grid -->
		<form action="/VendaWEB/servletTabela" method="post" id="form_insert">
			<fieldset ></fieldset>
			<label><input type="submit" name="cadastrar" value="Cadastrar" /></label>
		</form><!-- /form_insert -->
	</div><!-- /main -->
</body>
</html>