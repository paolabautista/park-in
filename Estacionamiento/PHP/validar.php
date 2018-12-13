<?php
session_start();
if(isset($_POST['email']) and isset($_POST['contrasena'])){
	include ('conexion.php');
	$correo_usuario = mysqli_real_escape_string($conexion, $_POST['email']);
	$password = mysqli_real_escape_string($conexion,$_POST['contrasena']);
	$comprobación_del_correo = 'SELECT * FROM usuarios WHERE Email="'.$correo_usuario.'"';
	$comprobacion = $conexion -> query($comprobación_del_correo);
	if($comprobacion -> num_rows > 0){
		$consulta_a_la_base = mysqli_query($conexion,'SELECT password FROM usuarios WHERE Email="'.$correo_usuario.'"');
		$consulta_a_la_base_dos = mysqli_query($conexion,'SELECT idUsuario FROM usuarios WHERE Email="'.$correo_usuario.'"');
		$recoger_dato = mysqli_fetch_assoc($consulta_a_la_base);
		$recoger_dato_dos = mysqli_fetch_assoc($consulta_a_la_base_dos);
		$comprobar_password = password_verify($password, $recoger_dato['password']);
		$opcion1 = "1";
		$opcion2 = "2";
		if($password == $recoger_dato['password'] && $recoger_dato_dos['idUsuario'] == $opcion1){
			$_SESSION['Email'] = $correo_usuario;
			header('location: ../inicioGestor.html');
		}
		elseif($password == $recoger_dato['password'] && $recoger_dato_dos['idUsuario'] == $opcion2){
			$_SESSION['Email'] = $correo_usuario;
			header('location: ../inicio.html');
		}else{
			print 'Los datos han sido incorrectos<br><a href="http://localhost/Estacionamiento/login.html">Volver</a>';
		}
	}else{
		print 'No se ha encontrado en el registro<br><a href="../login.html">Volver</a>';
	}
}else{
	header('location: ../login.html');
}
?>