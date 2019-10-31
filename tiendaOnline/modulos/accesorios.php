<?php
check_user("productos");

if(isset($agregar) && isset($cant)){
    $idp = clear($agregar);
    $cant = clear($cant);
    $id_cliente = clear($_SESSION['id_cliente']);
    $q = $mysqli->query("INSERT INTO carro (id_cliente,id_producto,cant) VALUES ($id_cliente,$idp,$cant)");
    alert("Se ha agregado al carro de compras");
    redir("?p=productos");
}


$q = $mysqli->query("SELECT * FROM productos WHERE cat = 3 ORDER BY id DESC");
while($r=mysqli_fetch_array($q)){
    ?>
        <div class= "producto">
        
        <div class="name_producto"> <?=$r['name']?> </div>
        
        
        
        
        <div><img class="img_producto" src="productos/<?=$r['imagen']?>"/> </div> 
        <span class="precio"><?=$r['price']?> <?=$divisa?></span>
        <button class="btn btn-warning pull-right" onclick="agregar_carro('<?=$r['id']?>');"><i class="fa fa-shopping-cart"></i></button>
        
        </div>
        <?php
}

?>

<script type="text/javascript">

    function agregar_carro(idp){
        var cant = prompt("Cantidad de articulos a adquirir",1);

        if(cant.length>0){
            window.location="?p=productos&agregar="+idp+"&cant="+cant;
        }
    }

</script>