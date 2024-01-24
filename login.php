<?php include 'header.php'; ?>
     
     <h1>Login</h1>

     <form action='loginVerify.php' method='POST'>
            <label>Correo:</label><br>
            <input type="email" name="correo"><br>
            <label>Peassword:</label><br>
            <input type="password" name="password"><br>
            <input type="submit" value="Log In">
     </form>

<?php include 'footer.php'; ?>