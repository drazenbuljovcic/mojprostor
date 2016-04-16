<?php

require_once ("db_config.php");

$connection=connectToDB();
session_start();

if(!empty($_POST["table"]))
{
    $table=$_POST["table"];

    $sql="SELECT * FROM '$table'";
    $result=mysqli_query($connection, $sql) or die(mysqli_error($connection));

    $status=array();
    while($record=mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
        if($record["is_premium"]=='y')
        {
           $status[]=$record;
        }
    }

    while($record=mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
        if($record["is_premium"]=='n')
        {
            $status[]=$record;
        }
    }

    echo json_encode($status);

}