<?php

    include 'db/dbconfig.php';

    if(!empty($_POST['correo']) && !empty($_POST['password']))
    {
        $correo = $_POST['correo'];
        $password = $_POST['password'];

        $usuarios = array();

        $db = new mysqli($server, $user, $pass, $database);

        if($db->connect_error)
        {
            die('Error: ' . $db->connect_error);
        }

        $query = $db->query("SELECT * FROM usuarios WHERE email = '". $correo ."' AND password = '" . $password . "'");
    
        //AQUI: verificar resultado
    }
    else
    {
        header('Location: login.php');
    }

?>