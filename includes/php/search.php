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
$table=$_POST["type"];
$status=$_POST["status"];
$size=$_POST["size"];
$min_price=$_POST["min_price"];
$max_price=$_POST["max_price"];
$roommate=$_POST["roommate"];
$city=$_POST["city"];
$parking=$_POST["parking"];



$whereArr=array();

if(!empty($status)) $whereArr[] = "status = {$status}";
if(!empty($size)) $whereArr[] = "size_m2 = {$size}";
if(!empty($min_price)) $whereArr[] = "price > {$min_price}";
if(!empty($max_price)) $whereArr[] = "price < {$max_price}";
if(!empty($roommate)) $whereArr[] = "roommate > 0";
if(!empty($city)) $whereArr[] = "location.city = {$city} ";
if(!empty($parking)) $whereArr[] = "parking_space = {$parking}";


$whereStr = implode(" AND ", $whereArr);

$sql="SELECT * FROM '$table' WHERE {$whereStr} ";
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