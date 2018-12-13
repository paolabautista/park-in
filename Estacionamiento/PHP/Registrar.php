<?php
session_start();
if(isset($_POST['nombre'])and isset($_POST['apellidos']) and isset($_POST['email']) and isset($_POST['telefono']) and isset($_POST['contrasena']) and isset($_POST['contrasena2']) and isset($_POST['acepto']) 
	and $_POST['contrasena'] == $_POST['contrasena2']){
	include 'conexion.php';
	$nombre=mysqli_real_escape_string($conexion,$_POST['nombre']);
	$apellidos=mysqli_real_escape_string($conexion,$_POST['apellidos']);
	$email=mysqli_real_escape_string($conexion,$_POST['email']);
	$telefono=mysqli_real_escape_string($conexion,$_POST['telefono']);
	$contrasena=mysqli_real_escape_string($conexion,$_POST['contrasena']);
	
	$insertar=mysqli_query($conexion,'INSERT INTO usuarios(TipoUsuario,NombreUsuario,Apellido,Email,Telefono,password) VALUES(2,"'.$nombre.'","'.$apellidos.'","'.$email.'","'.$telefono.'","'.$contrasena.'")') or die ('No se pudo registrar<br>'.mysqli_error($conexion));

	mysqli_close($conexion);
	header('location: ../login.html');
} else{
	header('location: ../registro.html');

}
?>