<?php

function connectToDB()
{
    
    $host = "localhost";
    $username = "root";
    $password = "";
    $db = "mojprostor";


    $connection = mysqli_connect("$host", "$username", "$password", "$db") or die(mysqli_error($connection));


    mysqli_query($connection, "SET NAMES utf8") or die (mysqli_error($connection));
    mysqli_query($connection, "SET CHARACTER SET utf8") or die (mysqli_error($connection));
    mysqli_query($connection, "SET COLLATION_CONNECTION='utf8_general_ci'") or die (mysqli_error($connection));
   

    return $connection;
    
}
