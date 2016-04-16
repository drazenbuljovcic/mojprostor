<?php

require_once ("db_config.php");

$connection=connectToDB();

/*
 * type
 * status
 * size
 * min_price
 * max_price
 * roommate
 * city
 * parking
 * heating
 */

/*
 * mobile
 * distance
 * min-price
 * max_price
 * size
 */

//From desktop
$table=$_GET["type"];
$status=$_GET["status"];
$size=$_GET["size"];
$min_price=$_GET["min_price"];
$max_price=$_GET["max_price"];
$roommate=$_GET["roommate"];
$city=$_GET["city"];
$parking=$_GET["parking"];

//var_dump($table);

$whereArr=array();


if(!empty($status)) $whereArr[] = "status = '$status'";
if(!empty($size)) $whereArr[] = "size_m2 = {$size}";
if(!empty($min_price)) $whereArr[] = "price > {$min_price}";
if(!empty($max_price)) $whereArr[] = "price < {$max_price}";
if(!empty($roommate)) $whereArr[] = "no_roommates = '$roommate'";
if(!empty($city)) $whereArr[] = "location.city = '$city' ";
if(!empty($parking) AND $parking=="true") $whereArr[] = "parking_space >0 $parking";

//var_dump($whereArr);

$whereStr = implode(" AND ", $whereArr);

//var_dump($whereStr);

$sql="";
if($whereStr=="")
    $sql="SELECT * FROM $table , location WHERE $table".'.id_location'."=location.id_location";
else
    $sql="SELECT * FROM $table , location WHERE $table".'.id_location'."=location.id_location AND ".$whereStr;

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

echo json_encode($status);
//var_dump($status);