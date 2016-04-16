<?php

require_once ("db_config.php");

$connection=connectToDB();
//session_start();

if(!empty($_GET["table"]))
{
    $table=$_GET["table"];

    $sql="SELECT * FROM $table ";
    $result=mysqli_query($connection, $sql) or die(mysqli_error($connection));

    $status=array();
    while($record=mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
        if($record["is_premium"]=='y')
        {
            array_unshift($status,$record);
        }

        if($record["is_premium"]=='n')
        {
            $status[]=$record;
        }
    }

    var_dump($status);

    //echo json_encode($status);
    
}
?>