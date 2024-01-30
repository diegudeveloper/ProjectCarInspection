<?php

    //limpiar las cookies
    setcookie('userId', '', time() - 3600, '/');       
    setcookie('userEmail', '', time() - 3600, '/');
    setcookie('userName', '', time() - 3600, '/');
    setcookie('userLastName', '', time() - 3600, '/');
    setcookie('userRol', '', time() - 3600, '/');

    header('Location: login.php');
?>