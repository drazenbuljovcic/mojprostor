<?php

require_once ("db_config.php");

session_start();

$connection= connectToDB();

if(!empty($_SESSION["email"]) AND !empty($_SESSION["password"]))
{
    $email=$_SESSION["email"];
    $password=$_SESSION["password"];

    $sql="SELECT * FROM user WHERE email='$email' AND password= '$password'";
    $result=mysqli_query($connection, $sql) or die(mysqli_error($connection));
    $record=mysqli_fetch_array($result);

    $status="";
    $status["user"]=$record;
    $record["user"]["image"]="http://www.gravatar.com/avatar/".md5($record["email"]).".jpg";

    echo json_encode($status);

}
else
{
    $status="User not logged in!";
    echo json_encode($status);
}