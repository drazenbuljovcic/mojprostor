<?php

function connectToDB()
{
    //If secret not defined dont connect to database
    if(defined(SECRET) and SECRET=="65sdgf4s3g1dsg6sr84gsd35gs48gsrd") 
    {
        
        $host = "localhost";
        $username = "root";
        $password = "";
        $db = "mojprostor";
        
        global $connection;

        $connection = mysqli_connect("$host", "$username", "$password", "$db") or die(mysqli_error($connection));


        mysqli_query($connection, "SET NAMES utf8") or die (mysqli_error($connection));
        mysqli_query($connection, "SET CHARACTER SET utf8") or die (mysqli_error($connection));
        mysqli_query($connection, "SET COLLATION_CONNECTION='utf8_general_ci'") or die (mysqli_error($connection));
    }
    
}
