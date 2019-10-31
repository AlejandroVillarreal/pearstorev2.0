<?php
include "configs/config.php";
include "configs/funciones.php";

if(!isset($p)){
    $p = "productos";
}else{
    $p = $p;
}
?> 

<!DOCTYPE html>
<html>

    <head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="css/estilo.css"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="fontawesome/css/all.css"/>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="fontawesome/js/all.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/app.js"></script>


        <title> PearStore </title>
    </head>
    <body>
    <div class="header">PearStore</div>
        <div class="menu">
            <!--<a href="?p=principal">Principal</a> -->
            <a href="?p=productos">Productos</a>
            <a href="?p=carrito">Carrito</a>

            <?php
		if(isset($_SESSION['id_cliente'])){
		?>
		<a href="?p=miscompras">Mis Compras</a>
		<?php
		}else{
			?>
				<a href="?p=login">Iniciar Sesion</a>
				<a href="?p=registrarse">Registrate</a>
			<?php
		}
		?>

            

            <?php
            if (isset($_SESSION['id_cliente'])){
            ?>    

            <a class="float-right subir" href="?p=salir">Salir</a>
            <a class="float-right subir" href="a"><?=nombre_cliente($_SESSION['id_cliente'])?></a>
            <?php
            }
            ?>

        </div>  
        <div class="cuerpo">
        
        <?php
            if (file_exists("modulos/".$p.".php")){
                include "modulos/".$p.".php";
            }else{
                echo "<i> No se ha encontrado el modulo <b> ".$p." </b> <a href= './'>Regresar</a> </i>";
            }
            ?>

        </div>

        <div class="footer">Copyright PearStore &copy; <?=date("Y")?></div>
    </body>
</html>