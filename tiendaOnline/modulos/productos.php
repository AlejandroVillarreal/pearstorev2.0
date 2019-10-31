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
?>
<link rel="stylesheet" href="estilo.css" />
<main data-router-wrapper>
      <section data-router-view="home" class="home">
        <div class="home-content">
          <div class="home-presentation">
            <h1></h1>
            <p></p>
          </div>
          <a href="?p=laptops"> <img class="img_producto" src="./imagenes/laptoplogo.jpg" alt="home"  /><p style="color: black; text-align: center; font-family: ModernSans-Light; font-weight: bold;">Laptops</p></a>
          <a href="?p=smartphones"><img class="img_producto" src="./imagenes/smartphonelogo.jpg" alt="home" /><p style="color: black; text-align: center; font-family: ModernSans-Light; font-weight: bold;">Smartphones</p></a>
          <a href="?p=accesorios"><img class="img_producto" src="./imagenes/accesoriologo.jpg" alt="home" /><p style="color: black; text-align: center; font-family: ModernSans-Light; font-weight: bold;">Accesorios</p></a> 
        </div>
      </section>
    </main>

<script type="text/javascript">

    function agregar_carro(idp){
        var cant = prompt("Cantidad de articulos a adquirir",1);

        if(cant.length>0){
            window.location="?p=productos&agregar="+idp+"&cant="+cant;
        }
    }

</script>
