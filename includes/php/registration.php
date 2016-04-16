<?php

define("SALT1","sg4dsf846es64dfs2ef4");
define("SALT2","gs5g4s64g6s8gf4skyugkh5");

require_once ("db_config.php");
require_once ("functions.php");

$connection=connectToDB();
session_start();

if(!empty($_POST["email"]) and !empty($_POST["password"]) and !empty($_POST["first_name"]) and !empty($_POST["last_name"]))
{
    global $connection;

    $status=checkData($_POST["email"], $_POST["password"], $_POST["first_name"] ,$_POST["last_name"]);
    
    $email=mysqli_real_escape_string($connection,$_POST["email"]);
    $password=sha1(SALT1.mysqli_real_escape_string($connection,$_POST["password"]).SALT2);
    $first_name=mysqli_real_escape_string($connection,$_POST["first_name"]);
    $last_name=mysqli_real_escape_string($connection,$_POST["last_name"]);



    if($status["error"]===true)
    {
        echo json_encode($status);
    }

    else
    {
        $sql="INSERT INTO user (email, password, first_name, last_name, created) VALUES('$email','$password','$first_name','$last_name', NOW())";
        $result=mysqli_query($connection,$sql) or die(mysqli_error($connection));

        if(mysqli_affected_rows($connection)>0)
        {
            $status["database"]="ok";

            $id=mysqli_insert_id($connection);
            $sql="SELECT * FROM user WHERE id_user='$id'";
            $result=mysqli_query($connection, $sql) or die(mysqli_error($connection));
            $record=mysqli_fetch_array($result);

            $_SESSION["email"]=$record["email"];
            $_SESSION["password"]=$record["password"];

            $status="";
            $status["user"]=$record;
            $record["user"]["image"]="http://www.gravatar.com/avatar/".md5($record["email"]).".jpg";

            echo json_encode($status);
            
        }

        else
        {
            $status["database"]="Error writing into database!";
            echo json_encode($status);
            
        }
    }
}
else
{
    $status["error"] = true;
    echo json_encode($status);

}