<?php

check_admin();
if(isset($enviar)){
    $name = clear($name);
    $price = clear($price);
    $imagen = "";

    if(is_uploaded_file($_FILES['imagen']['tmp_name'])){
        $imagen = $name.rand(0,1000).".png";
        move_uploaded_file($_FILES['imagen']['tmp_name'],"productos/".$imagen);

    }

   $mysqli->query("INSERT INTO productos (name,price,imagen) VALUES ('$name','$price','$imagen')");
    alert("Producto Agregado");
    redir("?p=agregar_producto");

}

?>
<form method="post" action="" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" class="form-control" name="name" placeholder="Nombre del Producto"/>
    </div>

    <div class="form-group">
        <input type="text" class="form-control" name="price" placeholder="Precio del Producto"/>
    </div>

    <label>Imagen del Producto</label>
    <div class="form-group">
        <input type="file" class="form-control" name="imagen" title="Imagen del Producto"placeholder="Imagen del Producto"/>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-success" name="enviar">
            <i class="fa fa-check"></i>Agregar Producto
        </button>
    </div>

</form>