<?php
check_user('pagar_compra');

if(isset($subir)){
	$nombre = clear($nombre);

	$comprobante = "1.png";

	/*if(is_uploaded_file($_FILES['comprobante']['tmp_name'])){
		$comprobante = date("His").rand(0,1000).".png";
		move_uploaded_file($_FILES['comprobante']['tmp_name'], "comprobantes/".$comprobante);
	}*/

	$mysqli->query("INSERT INTO pagos (id_cliente,id_compra,comprobante,nombre,fecha) VALUES ('".$_SESSION['id_cliente']."','$id','$comprobante','$nombre',NOW())");

	alert("Compra Realizada con Exito",1,'miscompras');
	//redir("?p=miscompras");

}
?>

<h1>Metodos de pago</h1>

<table class="table table-striped">
<tr>
	<th>Tipo de pago</th>
	<th>Cuenta</th>
	<th>Beneficiario</th>
</tr>

<tr>
	<td>Transferencia Bancaria</td>
	<td>5565-8373-3216-3931</td>
	<td>PearStore.com</td>

</tr>
</table>

<table class="table table-striped">
<tr>
	<th>Tipo de pago</th>
	<th>Numero de Tarjeta</th>
	<th>Nombre del titular de la tarjeta</th>
</tr>

<tr>
	<td>Pago con Tarjeta</td>
	<td><input type="text" class="form-control" name="nombre" title="Ingrese el numero de 16 digitos"/></td>
	<td><input type="text" class="form-control" name="nombre" title="Nombre del titular de la tarjeta"/></td>
</tr>
</table>

<h3>En caso de transferencia, envie el comprobante de pago de la compra</h3>

<form method="post" action="" enctype="multipart/form-data">
	<div class="form-group">
		<label><small>Adjuntar comprobante</small></label>
		<input type="file" class="form-control" name="comprobante" title="Adjuntar Comprobante"/>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="nombre" title="Nombre de la persona que transfiere"/>
	</div>
	<div class="form-group">
		<input type="submit" name="subir" class="btn btn-primary" value="Confirmar"/>
	</div>
</form>

