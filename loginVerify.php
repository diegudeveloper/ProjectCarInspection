<?php

    include 'db/dbconfig.php';

    if(!empty($_POST['correo']) && !empty($_POST['password']))
    {
        $correo = $_POST['correo'];
        $password = $_POST['password'];

        $usuarios = array();
        //conexion base de datos
        $db = new mysqli($server, $user, $pass, $database);

        if($db->connect_error)
        {
            die('Error: ' . $db->connect_error);
        }

        $query = $db->query("SELECT * FROM usuarios WHERE email = '". $correo ."' AND password = '" . $password . "'");
    
        //verificar resultado
        if($query->num_rows > 0)
        {
            for($i = 0; $i < $query->num_rows; $i++)
            {
                $userData = $query->fetch_assoc();       //transforma e registor en una array
                array_push($usuarios, $userData);        //agrega a informacion al array de usuarios
            }

                    //nombre        valor                 tiempo de caducidad  visibilidad
            setcookie('userId', $usuarios[0]['id'], time() + 60 * 60 * 24, '/');       
            setcookie('userEmail', $usuarios[0]['email'], time() + 60 * 60 * 24, '/');
            setcookie('userName', $usuarios[0]['nombre'], time() + 60 * 60 * 24, '/');
            setcookie('userLastName', $usuarios[0]['apellido'], time() + 60 * 60 * 24, '/');
            setcookie('userRol', $usuarios[0]['rol_id'], time() + 60 * 60 * 24, '/');

            //AQUI: agregar mensajes con sesiones

            if($usuarios[0]['rol_id'] == 1)  //administrador
            {
                header('Location: dashboard.php');
            }
            else  //inspector
            {
                header('Location: generarinspeccion.php'); 
            }

        }
        else
        {
            header('Location: login.php');
        }
    }
    else
    {
        header('Location: login.php');
    }

?>