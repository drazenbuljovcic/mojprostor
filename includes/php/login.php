<?php

//SECRET password for protecting database connection (connection not possible without secret)
define("SECRET","65sdgf4s3g1dsg6sr84gsd35gs48gsrd");
define("SALT1","sg4dsf846es64dfs2ef4");
define("SALT2","gs5g4s64g6s8gf4skyugkh5");
require_once ("db_config.php");

connectToDB();
session_start();

if(!empty($_POST["email"]) AND !empty($_POST["password"]))
{
    $email=$_POST["email"];
    $password=sha1(SALT1.$_POST["password"].SALT2); //crypting password to match with the crypted password in database


    global $connection;

    $sql="SELECT * FROM user WHERE email='$email' and password='$password'";
    $result=mysqli_query($connection,$sql) or die(mysqli_error($connection));

    if(mysqli_num_rows($result)>0)
    {
        $record["user"]=mysqli_fetch_array($result,MYSQLI_ASSOC);

        $_SESSION["email"]=$email;
        $_SESSION["password"]=$password;

        $send_back=json_encode($record);

        return $send_back;

    }
    else
    {
        $record["status"]="Nepostojeći nalog!";

        $send_back=json_encode($record);

        return $send_back;
    }
}
else
{
    $record["status"]="Nepravilni ulazni parametri!";

    $send_back=json_encode($record);

    return $send_back;
}
